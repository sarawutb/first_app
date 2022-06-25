import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constent.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: size.width * 0.6,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CupertinoActivityIndicator(),
            // Text("กำลังดำเนินการ...",style: TextStyle( decoration: TextDecoration.none,color: Colors.black87),)
            Text(
              "กำลังดำเนินการ...",
              style: styleFontLable.copyWith(color: Colors.black87),
            )
          ],
        ),
      ),
    ));
  }
}
