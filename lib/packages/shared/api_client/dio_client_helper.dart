import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../error/error_422_model.dart';
import '../error/failures.dart';
import '../localization/trans.dart';
import '../theme/helper.dart';
import 'connection_ckecker.dart';

abstract class ApiClientHelper {
  @Deprecated("Use   ..     responseOrFailure    ..    instead")
  static Future<Either<KFailure, dynamic>> responseToModel({Future<Response<dynamic>>? func, Response<dynamic>? res}) async {
    if (!(await ConnectivityCheck.call())) return left(const KFailure.offline());
    try {
      final response = (res ?? await func);

      return statusCodeChecker(response);
    } on DioException catch (e) {
      return left(dioExToFailureMap(e));
    } catch (e) {
      debugPrint('========Response Or Failure (catch) =========${e.toString()}');
      return left(const KFailure.someThingWrongPleaseTryAgain());
    }
  }

  static Future<Either<KFailure, dynamic>> responseOrFailure({Future<Response<dynamic>>? func, Response<dynamic>? res}) async {
    if (!(await ConnectivityCheck.call())) return left(const KFailure.offline());
    try {
      final response = (res ?? await func);
      return statusCodeChecker(response);
    } on DioException catch (e) {
      return left(dioExToFailureMap(e));
    } catch (e) {
      debugPrint('========Response Or Failure (catch) =========${e.toString()}');
      return left(const KFailure.someThingWrongPleaseTryAgain());
    }
  }

  static Either<KFailure, dynamic> statusCodeChecker(Response<dynamic>? response) {
    if (response?.statusCode == 200) {
      shoToastMsg(response);
      return right(response?.data);
    } else {
      final fail = statusCodeToFailureMap(response) ?? const KFailure.someThingWrongPleaseTryAgain();
      return left(fail);
    }
  }

  static void shoToastMsg(Response<dynamic>? response) {
    final show = response?.data["alert"] == true;
    final isError = response?.data["success"] == false;
    if (show) {
      final iconStr = response?.data["icon"].toString() ?? "";
      final colorStr = response?.data["color"].toString() ?? "";
      final iconInt = int.tryParse(iconStr);
      final colorInt = int.tryParse(colorStr);
      final color = colorInt == null ? null : Color(colorInt);

      final icon = (iconInt != null && iconInt > 1114111) ? null : iconInt;
      KHelper.showSnackBar(
        response?.data["message"] ?? "",
        barColor: color,
        title: Tr.get2(key: response?.data["status"].toString() ?? '', value: []),
        icon: Icon(
          icon == null ? (isError ? Icons.cancel_rounded : Icons.check_circle_outline_rounded) : IconData(icon),
          color: color,
        ),
      );
    }
  }

  static KFailure? statusCodeToFailureMap(Response<dynamic>? response) {
    final method = response?.requestOptions.method;
    final map = {
      401: const KFailure.error401(),
      403: const KFailure.error403(),
      404: const KFailure.error404(),
      405: KFailure.error("Method Not Allowed , you are using ( $method ) method "),
      409: const KFailure.error409(),
      500: const KFailure.server(),
      422: response?.data is Map<String, dynamic>
          ? KFailure.error422(Error422Model.fromJson(response?.data))
          : KFailure.error(response?.statusMessage ?? ""),
    };

    return map[response?.statusCode];
  }

  static KFailure dioExToFailureMap(DioException e) {
    final map = {
      DioExceptionType.connectionTimeout: const KFailure.connectionTimeout(),
      DioExceptionType.connectionError: const KFailure.connectionError(),
      DioExceptionType.receiveTimeout: const KFailure.receiveTimeout(),
      DioExceptionType.sendTimeout: const KFailure.sendTimeout(),
      DioExceptionType.badResponse: const KFailure.someThingWrongPleaseTryAgain(),
      DioExceptionType.unknown: e.error is SocketException ? const KFailure.offline() : null,
    };
    return map[e.type] ?? const KFailure.someThingWrongPleaseTryAgain();
  }
}
