import 'package:dio/dio.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:3000/api/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  );

  static void setToken(String token) {
    dio.options.headers["token"] = token;
  }
  
  static void removeToken() {
    dio.options.headers.remove("token");
  }

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> post(String path, {dynamic data}) =>
      dio.post(path, data: data);

  static Future<Response> put(String path, {dynamic data}) =>
      dio.put(path, data: data);

  static Future<Response> delete(String path) => dio.delete(path);
}
