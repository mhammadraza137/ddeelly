import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class BaseApiService{
  Dio? _dio;
  // By using _ongoingRequests in interceptor we can control and avoid multiple same requests and execute
  // only one request if multiple same requests are fired.
  final Map<String, Completer<Response>> _ongoingRequests = {};

  Dio get dio {
    if(_dio == null){
      _dio = Dio();
      _dio?.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true
      ));
      addInterceptors();
    }
    return _dio!;
  }

  void addInterceptors() {
    _dio?.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final requestKey = options.uri.toString();
        if (_ongoingRequests.containsKey(requestKey)) {
          debugPrint('same request is already running and this one is rejected');
          return handler.reject(DioException.requestCancelled(
            requestOptions: options,
            reason: null,
          ));
        }

        final completer = Completer<Response>();
        _ongoingRequests[requestKey] = completer;
        return handler.next(options);
      },
      onResponse: (response, handler) {
        final requestKey = response.requestOptions.uri.toString();
        _ongoingRequests[requestKey]?.complete(response);
        _ongoingRequests.remove(requestKey);
        return handler.next(response);

      },
      onError: (error, handler) {
        final requestKey = error.requestOptions.uri.toString();
        _ongoingRequests[requestKey]?.completeError(error);
        _ongoingRequests.remove(requestKey);
        return handler.next(error);
      },

    ));
  }
}