import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../constants/colors.dart';
import 'home_page.dart';

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: kGradient1,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(100), bottom: Radius.circular(100)),
            ),
          ),
          const Positioned(
            top: 20,
              left: 30,
              child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.analytics_outlined),
          )),
          const Positioned(
            top: 30,
            left: 80,
            child: Text('City air quality ranking', style: TextStyle(color: Colors.white),),),
          const Positioned(
            top: 30,
            left: 250,
            child: Text('No.531', style: TextStyle(color: Colors.white),),),
          const Positioned(
            top: 26,
            left: 290,
            child: Icon(Icons.keyboard_arrow_right, color: Colors.white,),)
        ],
      ),
      backgroundColor: kScaffoldbg,
      body: SafeArea(
        top: true,
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Air Quality',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 350,
            leadingWidth: 50,
            automaticallyImplyLeading: false,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  child: Image(
                    image: NetworkImage(
                        'https://freepngimg.com/download/cartoon/4-2-cartoon-transparent.png'),
                  ),
                ),
              )
            ],
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Container(
                  height: 350,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        color: Colors.white,
                      ),
                      Stack(clipBehavior: Clip.hardEdge, children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            gradient: kGradient1,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Positioned(
                          top: 3,
                          left: 4,
                          child: Container(
                            width: 100,
                            height: 34,
                            child: const Center(
                                child: Text(
                              'Day',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Positioned(
                          right: 3,
                          top: 3,
                          child: Container(
                            width: 100,
                            height: 34,
                            child: const Center(
                                child: Text(
                              'Month',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
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
                                              const Text(
                                                'MON',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${index}Feb',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(height: 20),
                                              const Icon(Icons.cloud),
                                              Container(height: 20),
                                              const Text(
                                                '26',
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 10,
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
                                                      color: Colors.white),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 2),
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
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 50,
            ),
            // SizedBox(
            //   width: double.infinity,
            //   height: 100,
            //   child: Image.asset('assets/images/rainy cloud.png'),
            // ),
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 300,
              width: 300,
              child: _getRadialGauge(),
            ),

            const SizedBox(
              height: 100,
            )
          ]))
        ]),
      ),
    );
  }
}





Widget _getRadialGauge() {
  return SfRadialGauge(
      title: const GaugeTitle(
          text: '',
          textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0, maximum: 150, interval: 10,
          //   ranges: <GaugeRange>[
          //   GaugeRange(
          //       startValue: 0,
          //       endValue: 100,
          //        gradient: const SweepGradient(colors:  <Color>[
          //          Color(0xffea76f4),
          //          Color(0xff4b78f7),
          //          Colors.red,
          //        ]),
          //       startWidth: 15,
          //       endWidth: 15),
          // ],
          pointers: const <GaugePointer>[
            NeedlePointer(
              value: 100,
              needleStartWidth: 1,
              needleEndWidth: 1,
              lengthUnit: GaugeSizeUnit.factor,
              enableAnimation: true,
            ),
            RangePointer(
              value: 100,
              enableAnimation: true,
              gradient: SweepGradient(colors: <Color>[
                Color(0xffea76f4),
                Color(0xff4b78f7),
                Colors.red,
              ]),
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: const Text('100.0',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5),
            GaugeAnnotation(
                widget: Container(
                    child: const Text('Moderate',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
                angle: 270,
                positionFactor: 0.5),
            GaugeAnnotation(
                widget: Container(
                    child: const Text('AQI',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.purple))),
                angle: 90,
                positionFactor: 0.3),
          ],
        )
      ]);
}
