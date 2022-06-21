//
//
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
//
// import '../model/weather_model.dart';
//
// class CityCall {
//    CityCall({this.temp, this.condition, this.cityName,  this.description});
//
//   final Dio dio = Dio();
//   final String kBaseURL = 'https://api.openweathermap.org';
//   final String kApikEY = 'dd87b2f2ebba995033f671b9f37c103a';
//   int? temp;
//   String? cityName;
//   String? condition;
//   String? description;
//
//   Future<dynamic> cityAPI() async {
//     try {
//       http.Response res = await http.get(Uri.parse('$kBaseURL/data/2.5/weather?q=PARIS&appid=$kApikEY'),);
//       if (res.statusCode == 200) {
//         print('THE STATUS CODE IS ACTUALLYYY 200: ${res.body}');
//         // var respy = res.data;
//         //  print('STTAAAAAAAAATTTUUUUUUUUUSSSSCOOOOOOOOOOOODE : ${res.statusCode}');
//         // print('THE RESPONSE IS ACTUALLYYY 200: ${respy}');
//         // String condition =  jsonDecode(respy)['weather'][0]['main'];
//         // print('THE WEATHER CONDITION IS AS THUS : ${condition}');
//        // WeatherModel wm = WeatherModel.fromJson(res.data);
//          temp = jsonDecode('res.data')['main']['temp'];
//
//         //debugPrint(res.toString());
//         print('What is going on? ${temp}');
//        // print('Weather model name is printed HERE: ${wm.name}');
//        // return WeatherModel.fromJson(jsonDecode(res.data));
//         return temp;
//       }
//     } on DioError catch (e) {
//       debugPrint('StatusCode:${e.response?.statusCode.toString()}');
//       throw Exception('Failed to load WeatherModel.fromJson');
//     }
//   }
//
// }
