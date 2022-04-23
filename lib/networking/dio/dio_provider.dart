import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class DioProvider {
  final String _baseUrl = "https://api.chucknorris.io/";

  Dio dio = Dio();

  DioProvider({bool? withAuth}) {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
   /* dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          print(withAuth);
          if (withAuth == true) {
            var headers = {
              'content-type': 'application/json',
              'Authorization': "Bearer " ""
            };
            requestOptions.headers.addAll(headers);
          } else {
            var headers = {'content-type': 'application/json'};
            requestOptions.headers.addAll(headers);
          }
        },
      ),
    );*/
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if (method == Method.POST) {
        response = await dio.post(_baseUrl + url, data: params);
      } else if (method == Method.DELETE) {
        response = await dio.delete(_baseUrl + url);
      } else if (method == Method.PATCH) {
        response = await dio.patch(_baseUrl + url);
      } else {
        response = await dio.get(_baseUrl + url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does won't wrong");
      }
    } on SocketException {
      throw Exception("Not Internet Connection");
    } on FormatException {
      throw Exception("Bad response format");
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception("Something won't wrong");
    }
  }
}
