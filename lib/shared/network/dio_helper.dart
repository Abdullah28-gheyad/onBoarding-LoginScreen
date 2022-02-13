import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'http://abdullahghayad.mocklab.io',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> postData({required String path, required Map data}) {
    dio.options.headers={
      'Content-Type':'application/json'
    };
    return dio.post(path, data: data);
  }

  static Future<Response> getData({required String path, required Map data}) {
    dio.options.headers={
      'Content-Type':'application/json'
    };
    return dio.get(path,);
  }
}
