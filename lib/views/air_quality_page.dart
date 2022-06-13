import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AirQualityPage extends StatelessWidget {
  const AirQualityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              'Air Quality',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            pinned: false,
            floating: false,
            snap: false,
            expandedHeight: 350,
            leadingWidth: 50,
            automaticallyImplyLeading: false,
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: CircleAvatar(),
              )
            ],
            leading: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white,
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
                          child: Center(
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
                          child: Center(
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
                    SizedBox(
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Container(height: 20),
                                            const Icon(Icons.cloud),
                                            Container(height: 20),
                                            const Text(
                                              '26',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold),
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
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              width: double.infinity,
              height: 500,
              child: Image.asset('assets/images/rainy cloud.png'),
            ),
          ]))
        ]),
      ),
    );
  }
}
