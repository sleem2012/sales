import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import '../../../di.dart';
import '../../../main.dart';
import '../../../packages/shared/api_client/connection_ckecker.dart';
import '../../cache/locale_storage.dart';
import '../api_client/dio_client_helper.dart';
import '../error/failures.dart';
import 'api_client_state.dart';

class ApiClientBloc extends Cubit<ApiClientState> {
  ApiClientBloc() : super(const ApiClientState.initial());

  static ApiClientBloc of(BuildContext context) => BlocProvider.of<ApiClientBloc>(context);

  Future<void> onErrorCallBack(DioException error) async {
    emit(const ApiClientState.initial());
    final failure = ApiClientHelper.dioExToFailureMap(error);
    emit(ApiClientState.error(failure: failure));
  }

  onResponseCallBack(Response<dynamic> response) async {
    emit(const ApiClientState.initial());
    final failure = ApiClientHelper.statusCodeToFailureMap(response);
    if (failure == null) return;
    emit(ApiClientState.error(failure: failure));
  }

  onRequestCallBack(RequestOptions request) {
    final token = KStorage.i.getToken;
    final language = KStorage.i.getLang ?? "en";
    request
      ..headers.addAll({'Authorization': "Bearer $token"})
      ..headers.addAll({"lang": language})
      ..headers.addAll({"type": appName});
  }

  Future<Response> scheduleRetry(RequestOptions options) {
    final responseCompleter = Completer<Response>();
    late StreamSubscription subscription;
    debugPrint('================= Schedule Retry For: ${options.path} ');
    emit(ApiClientState.error(failure: KFailure.offline(option: options)));

    subscription = ConnectivityCheck.connectionStream.listen((event) {
      if (event != ConnectivityResult.none) {
        if (Get.isDialogOpen!) {
          Get.back();
        }
        responseCompleter.complete(
          Di.dioClient.request(
            options.path,
            cancelToken: options.cancelToken,
            data: options.data,
            onReceiveProgress: options.onReceiveProgress,
            onSendProgress: options.onSendProgress,
            params: options.queryParameters,
          ),
        );
        subscription.cancel();
      }
    });
    return responseCompleter.future;
  }
}
