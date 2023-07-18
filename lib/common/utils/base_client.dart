import 'package:dio/dio.dart';
import 'package:easypay/constants/url.dart';

class BaseClient {
  late Dio _dio;

  BaseClient() {
    _dio = Dio();
    _dio.options.baseUrl = Urls.baseUrl;
    _dio.options.connectTimeout = const Duration(milliseconds: 5000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 5000);
  }

  Future<Response> get(String endpoint, Map<String, String> header) async {
    return await _dio.get(
      endpoint,
    );
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    return await _dio.post(endpoint, data: data);
  }

  Future<Response> put(String endpoint, Map<String, String> queryParameter,
      Map<String, dynamic> data) async {
    return await _dio.put(endpoint,
        queryParameters: queryParameter, data: data);
  }

  Future<Response> delete(String endpoint) async {
    return await _dio.delete(endpoint);
  }

  void addHeaders(Map<String, dynamic> headers) {
    _dio.options.headers.addAll(headers);
  }
}
