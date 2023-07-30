import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../widgets/text_field.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/picker/logic/location_cubit/location_cubit.dart';
import '../../../shared/picker/logic/location_cubit/location_state.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import '../../../widgets/icon_button.dart';
import '../../logic/msg_bloc/messages_bloc.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({Key? key, required this.hideSend}) : super(key: key);
  final bool hideSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10).copyWith(top: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutCubic,
                decoration: KHelper.of(context).filled,
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.only(bottom: 5),
                height: MessagesBloc.of(context).selectedImage != null ? 200 : 0,
                width: Get.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(KHelper.cornerRadius),
                  child: MessagesBloc.of(context).selectedImage != null
                      ? Image.file(
                          MessagesBloc.of(context).selectedImage!,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              if (MessagesBloc.of(context).selectedImage != null)
                Positioned(
                  right: 0,
                  child: KIconButton(
                    onPressed: MessagesBloc.of(context).del_img,
                    child: const Icon(Icons.cancel),
                  ),
                )
            ],
          ),
          if (MessagesBloc.of(context).selectedFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.file_copy),
                  const SizedBox(width: 10),
                  Expanded(child: Text(MessagesBloc.of(context).selectedFile!.name, overflow: TextOverflow.ellipsis, maxLines: 1)),
                  const SizedBox(width: 8),
                  KIconButton(
                    onPressed: MessagesBloc.of(context).del_file,
                    child: Icon(Icons.cancel, color: KColors.of(context).error),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: KTextFormField(
                    hintText: Tr.get.message,
                    expanded: true,
                    keyboardType: TextInputType.text,
                    controller: MessagesBloc.of(context).txtCtrl,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        KIconButton(
                          onPressed: MessagesBloc.of(context).pick_file,
                          child: Icon(Icons.attach_file_rounded, color: KColors.of(context).activeIcons),
                        ),
                        KIconButton(
                          onPressed: MessagesBloc.of(context).pick_image,
                          child: Icon(Icons.camera, color: KColors.of(context).activeIcons),
                        ),
                        BlocBuilder<GetLocationCubit, GetLocationState>(
                          builder: (context, state) {
                            return KIconButton(
                              isLoading: state is GetLocationLoading,
                              onPressed: () {
                                /// showDialog(
                                ///   context: context,
                                ///   builder: (context) => LocationPicker(),
                                /// );

                                GetLocationCubit.of(context).initLocation().then((value) async {
                                  value.fold(
                                    (l) => KHelper.showSnackBar(KFailure.toError(l)),
                                    (r) async {
                                      debugPrint('================= ${r.toJson()} : ');
                                      MessagesBloc.of(context).share_location(context, initLocation: r);
                                    },
                                  );
                                });
                              },
                              child: Icon(Icons.location_on, color: KColors.of(context).activeIcons),
                            );
                          },
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                if (hideSend)
                  const SizedBox(width: 48)
                else
                  GestureDetector(
                    onTap: MessagesBloc.of(context).send_msg,
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: KColors.of(context).accentColor),
                      child: const Icon(Icons.send, color: Colors.white, size: 20),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
