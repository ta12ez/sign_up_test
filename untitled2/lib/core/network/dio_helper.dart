import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(

        receiveDataWhenStatusError: true,
        ));
  }

  static Future<Response> getData(
      {required String url,
       Map<String, dynamic>? qury,
        dynamic data,

        String lang = 'en',
      dynamic token}) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': 'Bearer ${token}'
    };
    return await dio!.get(url, queryParameters: qury,data: data);
  }
  static Future<Response> deleteData(
      {required String url,
        Map<String, dynamic>? qury,
        dynamic data,
        String lang = 'en',
        dynamic token}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': 'Bearer ${token}'
    };
    return await dio!.delete(url, queryParameters: qury,data: data);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? qury,
       dynamic data,
      dynamic token,
      String lang = 'en'}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': 'Bearer ${token}'
    };
    return await dio!.post(
      url,
      queryParameters: qury,
      data: data,
    );
  }
  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? qury,
        required  dynamic data,
        dynamic token,
        String lang = 'en'}) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': '${lang}',
      'Authorization': 'Bearer ${token}'
    };
    return await dio!.put(
      url,
      queryParameters: qury,
      data: data,
    );
  }
}
