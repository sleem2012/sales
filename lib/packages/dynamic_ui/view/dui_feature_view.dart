import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../views/widgets/loading/loading_overlay.dart';
import '../../shared/error/failures.dart';
import '../../shared/theme/helper.dart';
import '../logic/dui_get_post/dui_get_post_bloc.dart';
import '../logic/dui_get_post/dui_get_post_state.dart';
import '../model/dynamic_ui_model.dart';
import 'dynamic_helper/dynamic_helper.dart';
import 'dynamic_ui_view.dart';

class DynamicFeatureView extends StatelessWidget {
  final DuiPostMapType postMapType;
  final List<Widget>? additionalFields;
  final bool? additionalFieldsInTop;
  final String? submitTitle, title;
  final String get_url, post_url;
  final List<DUIFieldModel>? initFields;
  final Map<String, dynamic> Function(Map<String, dynamic> values) onConfirm;
  final EdgeInsetsGeometry? padding;
  final Map<String, dynamic>? getParams;
  final Function(dynamic)? onPostSuccess;
  final Function(KFailure, Map<String, dynamic>)? onPostError;

  const DynamicFeatureView({
    super.key,
    required this.onConfirm,
    this.additionalFields,
    this.padding,
    this.submitTitle,
    this.title,
    this.getParams,
    this.initFields,
    this.additionalFieldsInTop = false,
    required this.get_url,
    required this.post_url,
    required this.postMapType,
    this.onPostSuccess,
    this.onPostError,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DuiGetPostBloc(), //..get(get_url, getParams),
      child: BlocConsumer<DuiGetPostBloc, DuiGetPostState>(
        listener: (context, state) {
          state.whenOrNull(postSuccess: onPostSuccess, postError: onPostError);
        },
        builder: (context, state) {
          final fields = state.whenOrNull(getSuccess: (model) => model.fields);

          return KRequestOverlay(
            isLoading: state.maybeWhen(orElse: () => false, getting: () => true),
            error: state.whenOrNull(getError: (e, _) => KFailure.toError(e)),
            onTryAgain: () {
              state.whenOrNull(
                getError: (_, params) => DuiGetPostBloc.of(context).get(get_url, params),
                postError: (_, map) => DuiGetPostBloc.of(context).post(post_url, map),
              );
            },
            child: DynamicUi(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
              title: title,
              fields: initFields ?? fields ?? [],
              submitTitle: submitTitle,
              additionalFields: additionalFields,
              additionalFieldsInTop: additionalFieldsInTop,
              posting: state.maybeWhen(orElse: () => false, posting: () => true),
              failure: state.whenOrNull(postError: (e, _) => e),
              onConfirm: (values, answer_col, grouped_a_col, values_with_key) {
                late Map<String, dynamic> map;
                switch (postMapType) {
                  case DuiPostMapType.valuesWithId:
                    map = values;
                    break;
                  case DuiPostMapType.valuesWithKey:
                    map = values_with_key;
                    break;
                  case DuiPostMapType.answerCollection:
                    map = answer_col;
                    break;
                  case DuiPostMapType.groupedAnswerCollection:
                    map = grouped_a_col;
                    break;
                }
                final modifiedValues = onConfirm.call(map);
                DuiGetPostBloc.of(context).post(post_url, modifiedValues);
              },
            ),
          );
        },
      ),
    );
  }
}
