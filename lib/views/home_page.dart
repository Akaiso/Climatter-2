

import 'dart:convert';

import 'package:climatter_2/constants/url_constants.dart';
import 'package:climatter_2/main.dart';
import 'package:climatter_2/services/network_service.dart';
import 'package:climatter_2/views/air_quality_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui';
import '../constants/colors.dart';
import 'package:geolocator/geolocator.dart';
import '../model/weather_model.dart';
import '../services/location_service.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final WeatherIcon weatherIcon = WeatherIcon();
  final TextEditingController _controller = TextEditingController();

  double htemperature = 0.0;
  int hcondition = 0;
  String hdescription = 'waiting...';
  String hcityname = 'cityname';
  double mlongitude = 0.0;
  double mlatitude = 0.0;
  double hfeelsLike = 0.0;
  bool isLoading = false;
  String path = 'assets/images/gif/heavy_rain.gif';





  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    mlongitude = location.longitude;
    mlatitude = location.latitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$mlatitude&lon=$mlongitude&appid=$kApikEY&units=metric');
    var weatherData1 = await networkHelper.getData();
    setState(() {
      htemperature = weatherData1['main']['temp'];
      hcityname = weatherData1['name'];
      hcondition = weatherData1['weather'][0]['id'];
      hdescription = weatherData1['weather'][0]['description'];
      hfeelsLike = weatherData1['main']['feels_like'];
       path =   weatherIcon.selectIcon(hcondition) ;
       weatherData1.map((e)=>WeatherModel.fromJson(e)).toString();
      print ('THIS IS A GREAT WEATHER MODEL: ${WeatherModel.fromJson(weatherData1).main.temp}');
    });
    print(htemperature);
    print('the getLocationData is : $mlongitude and $mlatitude');
  }




  Future cityNameCall() async {

    NetworkHelper networkHelper2 = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$hcityname&appid=$kApikEY&units=metric');
    var weatherData2 = await networkHelper2.getData();
    setState(() {
    });
    hcityname = _controller.text;
    htemperature = weatherData2['main']['temp'];
    hcondition = weatherData2['weather'][0]['id'];
    hdescription = weatherData2['weather'][0]['description'];
    hfeelsLike = weatherData2['main']['feels_like'];
    path =  weatherIcon.selectIcon(hcondition) ;
    setState(() {});
  }

  Future<LocationPermission> permit() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }


  bool changeColor = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permit();
    getLocationData();
    isLoading = false;

  }

  @override
  Widget build(BuildContext context) {

    int pressAttentionIndex = -1;
  //  bool isPressed = false;
   // List rowData = [0,1,2,3,4,5,6];
    Gradient onTapColor = kListViewNoColor;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            getLocationData();
            isLoading = true;
            Future.delayed(const Duration(seconds: 3), () async {
              isLoading = false;
              setState(() {});
            });
          },
          label: const Text('your location'),
        ),
        drawer: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
          margin: const EdgeInsets.symmetric(vertical: 90),
          height: 100,
          child: Drawer(
            backgroundColor: Colors.red,
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      gradient: kGradient1),
                  child: TextFormField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.blue),
                    // controller: searchController,
                    decoration: InputDecoration(
                        filled: true,
                        suffixIcon: InkWell(
                            onTap: () {
                              isLoading = true;

                              cityNameCall();
                              Future.delayed(const Duration(seconds: 3), () {
                                isLoading = false;
                              });
                              setState(() {});
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.adaptive.arrow_forward,
                                color: Colors.blue)),
                        fillColor: Colors.white,
                        hintText: 'Search location',
                        hintStyle: const TextStyle(color: Colors.blue),
                        helperText:
                            '- The name of a city you are interested in -',
                        helperStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(10),
                        //   borderSide:   BorderSide.none,
                        // ),
                        border: InputBorder.none),
                  ),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        backgroundColor: kScaffoldbg,
        appBar: AppBar(
          leadingWidth: 75,
          automaticallyImplyLeading: false,
          leading: SizedBox(
            width: 100,
            height: 20,
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'SLIDE',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.blue,
                )
              ],
            ),
          ), //(child: const Icon(Icons.search,color: Colors.blue,size: 35,)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 90,
          centerTitle: true,

          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      child: Icon(
                        Icons.location_pin,
                        size: 18,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),

                  // isLoading
                  //     ? Container(height: 2,width:60,child: LinearProgressIndicator(backgroundColor: Colors.white,color: Colors.deepPurple,))
                  //   :

                  Text(
                    hcityname,
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                width: 70,
                decoration: BoxDecoration(
                  gradient: kGradient1,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: isLoading
                        ? const SizedBox(
                            width: 25,
                            child: LinearProgressIndicator(
                                backgroundColor: Colors.deepPurple,
                                color: Colors.white))
                        : const Text(
                            'updating',
                            style: TextStyle(fontSize: 10),
                          )),
              )
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                // backgroundColor: Colors.orangeAccent,
                child: Image(
                  image: NetworkImage(
                      'https://freepngimg.com/download/cartoon/4-2-cartoon-transparent.png'),
                ),
              ),
            ),
          ],
        ),


        ///THE FIRST CARD
        body: RefreshIndicator(
         // displacement: 40,
          color: Colors.black,
          onRefresh: () async{ getLocationData();
          initState();
          setState(() {});
         // return ;
          },
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 200,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: kGradient1),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -23,
                              left: 20,
                              child: Container(
                                padding: EdgeInsets.all(0),
                                height: 170,
                                width: 170,
                                child:  Image(
                                  image: AssetImage(
                                   path ,  // 'assets/images/gif/heavy_rain.gif',
                                  ),
                                ),
                              ),
                            ),
                            isLoading
                                ? Positioned(
                                    right: 80,
                                    top: 40,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: const [
                                        SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ))
                                      ],
                                    ),
                                  )
                                : Positioned(
                                    right: 30,
                                    top: 10,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        isLoading
                                            ? const Positioned(
                                                right: 30,
                                                top: 50,
                                                child: SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                    )))
                                            : Text(
                                                htemperature.toInt().toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 70,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                        const Text(
                                          '°',
                                          style: TextStyle(
                                              fontSize: 50,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFeatures: [
                                                FontFeature.superscripts()
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                            Positioned(
                              right: 53,
                              top: 82,
                              child: Wrap(
                                  direction: Axis.horizontal,
                                  children:  [
                                    Text(
                                      'Feels like ${hfeelsLike.toInt()}',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const Text(
                                      '°',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFeatures: [
                                          FontFeature.superscripts()
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                            Positioned(
                              left: 24,
                              top: 130,
                              child: Text(
                                hdescription,
                                style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                            const Positioned(
                              left: 26,
                              top: 157,
                              child: Text(
                                'Monday, 12 Feb',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                            const Positioned(
                              right: 65,
                              top: 125,
                              child: Icon(
                                Icons.ac_unit,
                                size: 50,
                                color: Colors.black26,
                              ),
                            ),
                            const Positioned(
                              right: 25,
                              top: 130,
                              child: Icon(
                                Icons.air,
                                size: 40,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      ///THE SECOND CARD
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AirQualityPage()));
                        },
                        child: Container(
                          height: 200,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: SvgPicture.asset(
                                            'assets/images/cloudy.svg',
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Text('Air Quality',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700))
                                      ],
                                    ),
                                    SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: FloatingActionButton(
                                            onPressed: () {},
                                            backgroundColor: Colors.white,
                                            foregroundColor: Colors.black,
                                            child: const Icon(Icons.refresh))),
                                  ],
                                ),

                                ///SECOND ROW
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          Container(
                                              height: 30,
                                              width: 30,
                                              child: Image.asset(
                                                'assets/images/partly-cloudy.png',
                                                color: Colors.deepPurple,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            children: const [
                                              SizedBox(height: 5),
                                              Text(
                                                'real feel',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 9),
                                              ),
                                              Text('23.8',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          SizedBox(
                                              height: 27,
                                              width: 27,
                                              child: Image.asset(
                                                'assets/images/windy.png',
                                                color: Colors.deepPurple,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            children: const [
                                              Text(
                                                'wind',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 9),
                                              ),
                                              Text('9km/hr',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          Container(
                                              height: 22,
                                              width: 22,
                                              child: Image.asset(
                                                'assets/images/droplet.png',
                                                color: Colors.deepPurple,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            children: const [
                                              Text(
                                                'S02',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 9),
                                              ),
                                              Text('0.9',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                ///  THIRD ROW
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          SizedBox(
                                              height: 27,
                                              width: 27,
                                              child: Image.asset(
                                                'assets/images/partly-cloudy.png',
                                                color: Colors.deepPurple,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            children: const [
                                              Text(
                                                'Chance of rain',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 9),
                                              ),
                                              Text('68%',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: Image.asset(
                                              'assets/images/sun.png',
                                              color: Colors.deepPurple,
                                            ),
                                          ),

                                          // const SizedBox(
                                          //   width: 5,
                                          // ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            children: const [
                                              Text(
                                                'uv index',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 9),
                                              ),
                                              Text('3',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 0),
                                    SizedBox(
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: [
                                          SizedBox(
                                              height: 30,
                                              width: 25,
                                              child: Image.asset(
                                                'assets/images/sea.png',
                                                color: Colors.deepPurple,
                                              )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Wrap(
                                            direction: Axis.vertical,
                                            children: const [
                                              Text(
                                                '03',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 9),
                                              ),
                                              Text('50',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Weekly forecast',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Wrap(
                            direction: Axis.horizontal,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'Next Month',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.deepPurple),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  size: 20,
                                  color: Colors.deepPurple,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 40),


                      ///THIRD SECTION

                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            primary: true,
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {

                              return Row(
                                children: [
                                  const SizedBox(
                                    width: 9,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      changeColor = !changeColor;
                                     // onTapColor = kGradient1;
                                      setState(() {});
                                     // onTapColor = kGradient1;
                                     // print(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        gradient: changeColor? kGradient1 : onTapColor,
                                      ),
                                      width: 54,
                                      child: ListView(
                                          shrinkWrap: true,
                                          itemExtent: 160,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Mon',
                                                  style: TextStyle(
                                                      letterSpacing: 1,
                                                      fontSize: 11,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  '${index}Feb',
                                                  style: const TextStyle(
                                                      letterSpacing: 0.8,
                                                      fontSize: 10.7,
                                                      color: Colors.white),
                                                ),
                                                Container(height: 10),
                                                Container(
                                                    height: 30,
                                                    width: 30,
                                                    child: Image.asset(
                                                        'assets/images/gif/partly_cloudy.gif')),
                                                Container(height: 10),
                                                const Text(
                                                  '26°',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 23,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(20),
                                                    color: Colors.redAccent,
                                                  ),
                                                  child: const Text(
                                                    '193',
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.white),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 07,
                                                          vertical: 2),
                                                )
                                              ],
                                            ),
                                          ]),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                ],
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 100,
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.only(top: 80.0),
                          child: Text(
                            'AKAISO  BENSON',
                            style: TextStyle(
                                letterSpacing: 4,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        )),
                      ),
                    ]),
              )),
        ),
      ),
    );
  }


}


