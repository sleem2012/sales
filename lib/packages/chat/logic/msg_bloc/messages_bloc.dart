import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart' show Level;

import '../../../../di.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../../cache/locale_storage.dart';
import '../../../extensions.dart';
import '../../../modules/models/user_info/user_model.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/logger.dart';
import '../../../widgets/pick_image_widget.dart';
import '../../data/models/chat_model.dart';
import '../../data/models/chat_rooms_model.dart';
import '../../data/models/send_msg_model.dart';
import '../../data/repo/chat_repo.dart';
import '../messages_helper.dart';
import 'send_msg_state.dart';

class MessagesBloc extends Cubit<MessagesState> {
  MessagesBloc() : super(const MessagesState.loading()) {
    txtCtrl_listener();
  }
  static MessagesBloc of(BuildContext context) => BlocProvider.of<MessagesBloc>(context);

  int? get my_id => KStorage.i.getUserInfo?.data?.id;
  String? get my_name => KStorage.i.getUserInfo?.data?.name;
  String? get my_email => KStorage.i.getUserInfo?.data?.email;
  UserImage? get my_image => KStorage.i.getUserInfo?.data?.image;
  MsgSender get me_as_sender => MsgSender(id: my_id, name: my_name, email: my_email, image: my_image);

  final TextEditingController txtCtrl = TextEditingController();
  final FlutterSoundRecorder recorder = FlutterSoundRecorder(logLevel: Level.nothing);

  ChatMsgsModel? chatModel = ChatMsgsModel(data: []);
  File? selectedImage;
  PlatformFile? selectedFile;
  int? room_id;
  bool _showRecorder = true;

  bool get showRecorder => _showRecorder && selectedFile == null && selectedImage == null;

  txtCtrl_listener() {
    txtCtrl.addListener(() {
      if (txtCtrl.text.isEmpty && !_showRecorder) {
        _showRecorder = true;
        emit(MessagesState.showRecorder(showRecorder));
      } else if (txtCtrl.text.isNotEmpty && _showRecorder) {
        _showRecorder = false;
        emit(MessagesState.showRecorder(showRecorder));
      }
    });
  }

  int page = 1;
  int totalPages = -1;
  int page_count = 25;

  setMessages(Conversations? conversation) {
    room_id = conversation?.roomId;
    inInt_socket(room_id);
    chatModel = chatModel?.copyWith(data: chatModel?.data?..addAll(conversation?.messagesCollection ?? []), pagination: chatModel?.pagination);
    if ((conversation?.messagesCollection ?? []).length >= page_count) {
      totalPages = 2;
    } else {
      totalPages = 1;
    }
    _update;
    page += 1;
    _get_chat();
  }

  _get_chat() async {
    final result = await ChatRepoImp.i.get_chat(id: room_id, page: page, page_count: page_count);
    result.fold(
      (l) {
        debugPrint('================= Chat Bloc get_all_msg : ${KFailure.toError(l)}');
        emit(MessagesState.error(error: KFailure.toError(l)));
      },
      (r) {
        chatModel = chatModel?.copyWith(data: chatModel?.data?..addAll(r.data ?? []), pagination: chatModel?.pagination);
        totalPages = (r.pagination!.meta!.total! / page_count).ceil();
        emit(const MessagesState.success());
      },
    );
  }

  Future get_all_msg(int? room_id) async {
    this.room_id = room_id;
    try {
      if (page >= 1 && totalPages == page) return;
      if (page >= 1 && totalPages > page) {
        page++;
        emit(const MessagesState.loadMore());
      } else {
        page = 1;
        emit(const MessagesState.loading());
      }
      _get_chat();
    } catch (e) {
      debugPrint('================= Chat Bloc get_all_msg (Catch): ${e.toString()} ');
      emit(MessagesState.error(error: Tr.get.something_went_wrong));
    }
  }

  SendMsgModel get _msgModel => SendMsgModel(sender: me_as_sender, roomId: room_id);

  Future send_msg() async {
    if (txtCtrl.text.trim().isEmpty && selectedFile == null && selectedImage == null) return null;
    SendMsgModel msgModel = _msgModel.copyWith(key: UniqueKey(), messageType: _msg_type, message: await _make_msg(_msg_type));
    chatModel = chatModel?.copyWith(data: chatModel?.data?..insert(0, msgModel));
    _reset;
    // printMap(msgModel.message?.toMap());
    if (msgModel.messageType == MessageType.file || msgModel.messageType == MessageType.image) {
      await _upload_file(msgModel);
    } else {
      await _send_to_server(msgModel);
    }
  }

  get _reset {
    txtCtrl.clear();
    _showRecorder = true;
    selectedFile = null;
    selectedImage = null;
  }

  send_voice(String? path, int? duration) async {
    debugPrint('=================>>=== $path : ');
    if (path == null) return;
    SendMsgModel msgModel = _msgModel.copyWith(
      key: UniqueKey(),
      messageType: MessageType.voice,
      message: await _make_msg(MessageType.voice, path, duration),
    );
    chatModel = chatModel?.copyWith(data: chatModel?.data?..insert(0, msgModel));
    _reset;
    _upload_file(msgModel);
  }

  Future<void> _upload_file(SendMsgModel sendMsgModel) async {
    emit(MessagesState.uploading(sendMsgModel.message!.media!));
    final MultipartFile multipartFile = await MultipartFile.fromFile(sendMsgModel.message!.media!);
    final result = await ChatRepoImp.i.upload_file(file: multipartFile);
    result.fold(
      (l) {
        debugPrint('================= UploadFile Bloc : ${KFailure.toError(l)}');
        emit(MessagesState.error(error: KFailure.toError(l)));
      },
      (url) async {
        sendMsgModel = sendMsgModel.copyWith(message: sendMsgModel.message?.copyWith(media: url));
        await _send_to_server(sendMsgModel);
      },
    );
  }

  Future<void> _send_to_server(SendMsgModel sendMsgModel) async {
    emit(const MessagesState.successLocal());

    final result = await ChatRepoImp.i.send_msg(msg: sendMsgModel);
    result.fold(
      (l) {
        debugPrint('================= Chat Bloc get_all_msg : ${KFailure.toError(l)}');
        chatModel = chatModel?.copyWith(data: chatModel?.data?..removeWhere((element) => sendMsgModel.key == element.key));
        emit(const MessagesState.success());
      },
      (r) {
        chatModel = chatModel?.copyWith(data: chatModel?.data?.replaceFirst((element) => element.key == sendMsgModel.key, r));
        // printMap(r.message?.toMap());
        _socketEmit(r);
        emit(MessagesState.success(sendMsgModel: r, rId: room_id));
      },
    );
  }

  _socketEmit(SendMsgModel sendMsgModel) {
    Di.socket.emit('message', {"room": room_id, "auth": my_id, "message": sendMsgModel.toJson()});
    printMap({"room": room_id, "auth": my_id, "message": sendMsgModel.toJson()});
  }

  MessageType get _msg_type {
    if (selectedFile != null) return MessageType.file;
    if (selectedImage != null) return MessageType.image;

    return MessageType.text;
  }

  Future<MsgContent> _make_msg(MessageType msg_type, [String? voice_path, int? voice_duration]) async {
    return MsgHelper.make_msg(msg_type, voice_path, voice_duration, selectedImage, selectedFile, txtCtrl.text);
  }

  pick_image() async {
    final pickedFile = await ImageHelper.i.pickImage();
    if (pickedFile?.path != null) {
      selectedImage = File(pickedFile!.path);
    }
    _showRecorder = false;
    selectedFile = null;
    _update;
  }

  del_img() {
    selectedImage = null;
    if (txtCtrl.text.isEmpty) {
      _showRecorder = true;
    }
    _update;
  }

  del_file() {
    selectedFile = null;
    if (txtCtrl.text.isEmpty) {
      _showRecorder = true;
    }
    _update;
  }

  pick_file() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result?.files.map((e) => e).toList() != null && (result?.files.map((e) => e).toList() ?? []).isNotEmpty) {
      selectedFile = result?.files.map((e) => e).toList().first;
    }
    _showRecorder = false;
    selectedImage = null;
    _update;
  }

  inInt_socket(int? room_id) {
    debugPrint('=================> inInt_socket for message-$room_id ');
    Di.socket.on('message-$room_id', (data) => from_server(data));
    debugPrint('=================> Server Connection State : ${Di.socket.connected} ');
  }

  from_server(json) {
    debugPrint('=================> From Server : $json');
    SendMsgModel msgModel = SendMsgModel.fromJson(json['message']);
    chatModel = chatModel?.copyWith(data: chatModel?.data?..insert(0, msgModel));
    _update;
  }

  String? groupedDate;

  getCurrentDate(List<int> list) {
    final i = list.length > 1 ? (list[list.length-2]) : list.length;
    final current = chatModel?.data?[i].created_at?.split(' ').firstOrNull ?? 'now';

    if (groupedDate != current) {
      groupedDate = current;
      emit(MessagesState.updateDate(groupedDate));
    }
  }

  share_location(BuildContext context, {Position? initLocation}) {
    MsgHelper.share_location(context, (url) {
      txtCtrl.text = url;
      send_msg();
    }, initLocation: initLocation,);
  }

  get _update {
    emit(const MessagesState.loading());
    emit(const MessagesState.success());
  }

  @override
  close() async {
    Di.socket.off('message-$room_id');
    super.close();
  }
}
