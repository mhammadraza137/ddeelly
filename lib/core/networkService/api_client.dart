import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ddeelly/features/Auth/ui/login_screen.dart';
import 'package:ddeelly/utils/constants/navigator_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'base_api_service.dart';

class ApiClient extends BaseApiService {
  static ApiClient? _instance;

  ApiClient._();

  static ApiClient get instance => _instance ??= ApiClient._();

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw NoInternetException();
    }
    try {
      final response = await dio.get(url, queryParameters: params);
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw Exception("Unknown Error");
    }
  }

  Future<Response<dynamic>> post(String url, dynamic data) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw NoInternetException();
    }

    try {
      final response = await dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw Exception("Unknown Error");
    }
  }

  Future<Response<dynamic>> put(String url, dynamic data) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw NoInternetException();
    }

    try {
      final response = await dio.put(url, data: data);
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw Exception("Unknown Error");
    }
  }

  Future<Response<dynamic>> delete(String url) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw NoInternetException();
    }

    try {
      final response = await dio.delete(url);
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw Exception("Unknown Error");
    }
  }

  Future<Response<dynamic>> patch(String url, dynamic data) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw NoInternetException();
    }

    try {
      final response = await dio.patch(url, data: data);
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw Exception("Unknown Error");
    }
  }

  Exception handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutException();
      case DioExceptionType.cancel:
        return CancelledException();
      case DioExceptionType.connectionError:
        return HostConnectionException();
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 400) {
          return BadRequestException(error.response?.data);
        } else if (error.response?.statusCode == 401) {
          Navigator.pushAndRemoveUntil(
            NavigatorService.navigatorKey.currentContext!,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => true,
          );
          return UnauthorizedException();
        } else if (error.response?.statusCode == 404) {
          return NotFoundException();
        } else {
          return ServerException(error.response?.data);
        }
      case DioExceptionType.unknown:
        return SocketException(error.response?.data);
      default:
        return Exception("Unknown Dio Error");
    }
  }
}

class NoInternetException implements Exception {}

class TimeoutException implements Exception {}

class CancelledException implements Exception {}

class BadRequestException implements Exception {
  final dynamic data;

  BadRequestException(this.data);
}

class HostConnectionException implements Exception {}

class UnauthorizedException implements Exception {}

class NotFoundException implements Exception {}

class ServerException implements Exception {
  final dynamic data;

  ServerException(this.data);
}
