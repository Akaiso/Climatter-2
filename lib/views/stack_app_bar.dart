

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class StackAppBar extends StatefulWidget {
  const StackAppBar({Key? key}) : super(key: key);


  @override
  _StackAppBarState createState() => _StackAppBarState();
}

class _StackAppBarState extends State<StackAppBar> {
  final TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.green,
            height: 100,
              child: Stack(
                children:  [
                  Positioned(
                    top: 5,
                    left: 15,
                    child: AnimSearchBar(
                      textController: txtController,
                      width: MediaQuery.of(context).size.width,
                      onSuffixTap: () {
                        setState(() {
                          txtController.clear();
                        });
                      },
                    ),
                  )
                ],
              ),),
        ],
      ),
    );
  }
}
