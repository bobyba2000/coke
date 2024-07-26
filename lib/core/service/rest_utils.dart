import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../generated/l10n.dart';
import '../model/base_request_model.dart';
import '../model/base_response_model.dart';
import 'result.dart';

enum Method { get, post, put, delete }

class RestUtils {
  var logger = Logger();
  String baseUrl;

  RestUtils(this.baseUrl);

  Future<Result<T>> sendRequest<T extends BaseResponseModel>(
    Method method,
    String urlPath, {
    BaseRequestModel? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var serverUrl = baseUrl;
      final uri = Uri.parse(serverUrl + urlPath);
      final headers = {
        'Content-Type': 'application/json',
      };
      String? jsonBody = json.encode(data?.toJson());
      if (method == Method.get) {
        logger.d('✈️ REQUEST[${method.toString()}] => PATH: $uri \n');
      } else {
        try {
          logger.d(
              '✈️ REQUEST[${method.toString()}] => PATH: $uri \n DATA: ${jsonEncode(data)}');
        } catch (e) {
          logger.e('✈️ REQUEST[$method] => PATH: $uri \n DATA: $data');
        }
      }
      final encoding = Encoding.getByName('utf-8');
      http.Response? response;
      switch (method) {
        case Method.get:
          response = await http
              .get(
            uri,
            headers: headers,
          )
              .timeout(
            const Duration(seconds: 10),
            onTimeout: () {
              return http.Response(timeoutError, 500);
            },
          );
          break;
        case Method.post:
          response = await http
              .post(
            uri,
            headers: headers,
            encoding: encoding,
            body: jsonBody,
          )
              .timeout(
            const Duration(seconds: 60),
            onTimeout: () {
              return http.Response(timeoutError, 500);
            },
          );
          break;
        case Method.delete:
          response = await http
              .delete(
            uri,
            headers: headers,
            body: jsonBody,
            encoding: encoding,
          )
              .timeout(
            const Duration(seconds: 5),
            onTimeout: () {
              return http.Response(timeoutError, 500);
            },
          );
          break;
        case Method.put:
          response = await http
              .put(
            uri,
            headers: headers,
            body: jsonBody,
            encoding: encoding,
          )
              .timeout(
            const Duration(seconds: 5),
            onTimeout: () {
              return http.Response(timeoutError, 500);
            },
          );
          break;
      }
      ResponseResult<T> result =
          ResponseResult<T>.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        logger.d(
          '✅ RESPONSE[200] => PATH: $uri\n DATA: ${response.body}',
        );
        return Success<T>(result.data);
      } else {
        logger.e(
          '❌ RESPONSE[${response.statusCode}] => PATH: $uri\n ErrMessage: $response',
        );
        return Failed<T>(
          response.statusCode.toString(),
          result.error?.message ?? S.current.unknownError,
        );
      }
    } catch (e) {
      logger.e('❌ RESPONSE[null] => PATH: $urlPath \n ErrMessage: $e');
      return Failed<T>(
        '500',
        S.current.unknownError,
      );
    }
  }

  static String get timeoutError {
    Map<String, dynamic> err = {
      'is_success': false,
      'data': '',
      'err_code': '500',
      'err_msg': 'Time out request',
    };
    return jsonEncode(err);
  }
}
