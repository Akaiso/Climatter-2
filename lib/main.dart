


import 'package:climatter_2/views/home_page.dart';
import 'package:climatter_2/views/stack_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      home: SafeArea(
         child: HomePage(),
        //child: AirQualityPage(),
        //child: StackAppBar(),
      ),
    );
  }
}


