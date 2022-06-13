import 'package:climatter_2/views/air_quality_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:ui';

import '../constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.apps_rounded,
            color: Colors.orange,
          ),
          onPressed: () {},
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  'Lagos',
                  style: TextStyle(color: Colors.purple),
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
              child: const Center(
                  child: Text(
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
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
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
                        const Positioned(
                          top: -20,
                          child: SizedBox(
                            height: 150,
                            width: 180,
                            child: Image(
                              image:
                                  AssetImage('assets/images/rainy cloud.png'),
                            ),
                          ),
                        ),

                        Positioned(
                          right: 20,
                          top: 10,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '21',
                                  style: TextStyle(
                                    fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          Colors.white,
                                          Colors.white,
                                          Colors.grey,
                                          Colors.white,
                                          //add more color here.
                                        ],
                                      ).createShader(const Rect.fromLTWH(
                                          150.0, 100.0, 150.0, 100.0)),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'o',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFeatures: [
                                          FontFeature.superscripts()
                                        ],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 27),
                                  ),
                                ),
                              ]),
                        ),
                        const Positioned(
                          right: 53,
                          top: 82,
                          child: Text(
                            'Feels like 26',
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Positioned(
                          left: 30,
                          top: 130,
                          child: Text(
                            'Rain Showers',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        const Positioned(
                          left: 30,
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
                          right: 80,
                          top: 125,
                          child: Icon(
                            Icons.ac_unit,
                            size: 50,
                            color: Colors.black26,
                          ),
                        ),

                        const Positioned(
                          right: 40,
                          top: 140,
                          child: Icon(
                            Icons.wrap_text,
                            size: 30,
                            color: Colors.black26,
                          ),
                        ),

                        // Positioned(
                        //   right: 30,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     textBaseline: TextBaseline.alphabetic,
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         '21',
                        //         style: TextStyle(
                        //             height: null,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 80,
                        //             foreground: Paint()
                        //               ..shader = const LinearGradient(
                        //                 colors: <Color> [
                        //                   Colors.white,
                        //                   Colors.white,
                        //                   Colors.grey,
                        //                   Colors.grey,
                        //                   //add more color here.
                        //                 ],
                        //               ).createShader(Rect.fromLTWH(
                        //                   150.0, 200.0, 230.0, 100.0))),
                        //       ),
                        //       Text(
                        //         'Feels like 26',
                        //         style: TextStyle(fontSize: 15, height: null,color: Colors.white),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  ///THE SECOND CARD
                  InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder:(context)=>AirQualityPage()));},
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.cloud_done_outlined,
                                      color: Colors.deepPurple,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Air Quality',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700))
                                  ],
                                ),
                                const Icon(Icons.refresh),
                              ],
                            ),

                            ///SECOND ROW
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      const Icon(
                                        Icons.cloud_outlined,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: const [
                                          Text(
                                            'hey',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          ),
                                          Text('sup',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      const Icon(
                                        Icons.cloud_outlined,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: const [
                                          Text(
                                            'hey',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          ),
                                          Text('sup',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      const Icon(
                                        Icons.cloud_outlined,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: const [
                                          Text(
                                            'hey',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          ),
                                          Text('sup',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      const Icon(
                                        Icons.cloud_outlined,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: const [
                                          Text(
                                            'hey',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          ),
                                          Text('sup',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      const Icon(
                                        Icons.cloud_outlined,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: const [
                                          Text(
                                            'hey',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          ),
                                          Text('sup',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    children: [
                                      const Icon(
                                        Icons.cloud_outlined,
                                        color: Colors.deepPurple,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Wrap(
                                        direction: Axis.vertical,
                                        children: const [
                                          Text(
                                            'hey',
                                            style: TextStyle(
                                                color: Colors.grey, fontSize: 12),
                                          ),
                                          Text('sup',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
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
                          Icon(
                            Icons.arrow_right,
                            color: Colors.deepPurple,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Container(
                  //   height: 200,
                  //   width: Get.width ,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: Colors.black12
                  //   ),
                  // ),

                  ///THIRD SECTION
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        primary: true,
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: kGradient1,
                                ),
                                width: 50,
                                child: ListView(
                                    shrinkWrap: true,
                                    itemExtent: 200,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('MON', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                           Text('${index}Feb', style: TextStyle(color: Colors.white),),
                                          Container(
                                              height: 20),
                                          const Icon(Icons.cloud),
                                          Container(
                                              height: 20),
                                          const Text('26', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.redAccent,
                                            ),
                                            child: const Text('193',style: TextStyle(color: Colors.white),),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 6, vertical: 2),
                                          )
                                        ],
                                      ),
                                    ]),
                              ),
                              const SizedBox(
                                width: 20,
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
    );
  }
}
