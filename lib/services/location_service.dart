

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future getCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      ///ANOTHER WAY OF DOING THIS :
      // Position position = await GeolocatorPlatform.instance.getCurrentPosition(
      //     locationSettings: const LocationSettings(
      //         accuracy: LocationAccuracy.high));
      longitude = position.longitude;
      latitude = position.latitude;
      print('Naaaaaaaaaaaa heeeere ooooooooooooo current location: ${position}');

    }on DioError catch(e){
      throw Exception('$e grant internet access or connect to the internet');
    }
  }



}