import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/core/error/exceptions.dart';
import 'package:temry_market/core/error/failures_strings.dart';
import 'package:temry_market/core/util/methods.dart';

class DioHelper {
  Future<Map<String, String>> header() async {
    String token = await Methods.instance.returnUserToken();
    if (kDebugMode) {
      log(token);
    }
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };
    return headers;
  }

  Future<Options> options() async {
    Map<String, String> headers = await DioHelper().header();
    return Options(
      receiveDataWhenStatusError: true,
      sendTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      headers: headers,
    );
  }

  String getTypeOfFailure(
    Failuremessage failure,
  ) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Strings.serverFailureMessage;
      case NetworkFailure:
        return Strings.checkYourInternet;
      default:
        return Strings.unexpectederror;
    }
  }

  static Failuremessage buildFailure(dynamic e, {String? message1}) {
    switch (e.runtimeType) {
      case ServerException:
        return ServerFailure();
      case UnauthorizedException:
        return UnauthorizedFailure();
      case InternetException:
        return InternetFailure();
      case ErrorModelException:
        return ErrorMessageFailure(message: e.errorMessage!);
      default:
        return ErrorMessageFailure(message: e.toString());
    }
  }

  static dynamic handleDioError(
      {DioException? dioError, String? endpointName}) {
    if (kDebugMode) {
      log("dioError${dioError?.message}");
      log('endpointName$endpointName');
    }

    switch (dioError!.type) {
      case DioExceptionType.badResponse:
        throw handleStatuesCodeResponse(
            response: dioError.response, endpointName: endpointName);
      case DioExceptionType.connectionError:
        throw NetworkFailure();
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        throw handleStatuesCodeResponse(
            response: dioError.response, endpointName: endpointName);
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
    }
  }

  static Exception handleStatuesCodeResponse(
      {Response? response, String? endpointName}) {
    if (kDebugMode) {
      log("end point Name =$endpointName");
      log("status code${response?.statusCode}");
      log("error response${response?.data}");
    }
    switch (response?.statusCode) {
      case 500:
        throw ServerException();
      case 401:
        throw UnauthorizedException();
      default:
        if (response?.data.runtimeType == String) {
          throw ErrorModelException(errorMessage: response!.data);
        } else {
          throw ErrorModelException.fromJson(response!.data);
        }
    }
  }
}
