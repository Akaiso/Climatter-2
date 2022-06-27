

import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {

  NetworkHelper(this.url);
  final String url;
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
    )
  );

  Future getData() async {
    try {
     http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      }
    }on DioError catch(e){
      rethrow ;
     // throw Exception(e.response);
    }
  }

}