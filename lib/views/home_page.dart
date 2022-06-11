import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 20,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
        actions: const [
          CircleAvatar(
            // backgroundColor: Colors.orangeAccent,
            child: Image(
              image: NetworkImage(
                  'https://freepngimg.com/download/cartoon/4-2-cartoon-transparent.png'),
            ),
          ),
          SizedBox(
            width: 20,
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
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            stops: [0.4, 3],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xffea76f4),
                              Color(0xff4b78f7),
                            ])),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: -20,
                          child: Container(
                            height: 150,
                            width: 180,
                            child: Image(
                              image:
                                  AssetImage('assets/images/rainy cloud.png'),
                            ),
                          ),
                        ),

                        Positioned(
                          right: 30,
                          child: Text(
                            '21',
                            style: TextStyle(fontSize: 80),
                          ),
                        ),
                        Positioned(
                          right: 50,
                          top: 80,
                          child: Text(
                            'Feels like 26',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 130,
                          child: Text(
                            'Rain Showers',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          top: 160,
                          child: Text(
                            'Monday, 12 Feb',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                        Positioned(
                          right: 80,
                          top: 125,
                          child: Icon(Icons.ac_unit,size: 50,),
                        ),

                        Positioned(
                          right: 40,
                          top: 140,
                          child: Icon(Icons.wrap_text),
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
                  Container(
                    height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                               children: [
                                 Icon(Icons.cloud_done_outlined),
                                 Text('Air Quality')
                               ],
                              ),
                              Icon(Icons.refresh),
                            ],
                          ),
                          Row(),
                          Row()
                        ],
                      ),
                    ),
                  ),


                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Weekly forecast'),
                      Text('Next Month')
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
                  Container(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (_, index) {
                          return Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.blue,
                                ),
                                width: 50,
                                child: ListView(
                                    shrinkWrap: true,
                                    itemExtent: 180,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('13 Feb'),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text('MON'),
                                          Container(
                                              height: 20, color: Colors.red),
                                          const Icon(Icons.cloud),
                                          Container(
                                              height: 20, color: Colors.red),
                                          const Text('26'),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.orange,
                                            ),
                                            child: const Text('193'),
                                            padding: EdgeInsets.symmetric(
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
                        child: Text(
                      'AKAISO BENSON',
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )),
                  ),
                ]),
          )),
    );
  }
}
