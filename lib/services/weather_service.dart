

import 'dart:convert';
import 'package:dio/dio.dart';

class DioClient {

  final Dio dio = Dio();
  final String baseURL = "https://api.openweathermap.org";

  Future<dynamic> getApi({required double latitude, required double longitude}) async {
    try {
      Response res = await dio.get(baseURL +
          '/data/2.5/weather?lat=$latitude&lon=$longitude&appid=dd87b2f2ebba995033f671b9f37c103a');
      if (res.statusCode == 200) {
        print(res);
        dynamic response = jsonDecode(res.data);
        return response;
      }
    } on DioError {
      rethrow;
    }
  }
}