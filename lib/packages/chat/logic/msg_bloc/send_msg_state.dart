import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/send_msg_model.dart';

part 'send_msg_state.freezed.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState.loading() = SendMsgStateLoading;
  const factory MessagesState.loadMore() = SendMsgStateLoadMore;
  const factory MessagesState.uploading(String name) = SendMsgStateUploading;
  const factory MessagesState.success({int? rId, SendMsgModel? sendMsgModel}) = SendMsgStateSuccess;
  const factory MessagesState.successLocal() = SendMsgStateSuccessLocal;
  const factory MessagesState.updateDate(String? groupedDate) = SendMsgStateUpdateDate;
  const factory MessagesState.showRecorder(bool show) = SendMsgStateShowRecorder;
  const factory MessagesState.beforeClose(List<SendMsgModel> l, int? rId) = SendMsgStateBeforeClose;
  const factory MessagesState.error({required String error}) = SendMsgStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
