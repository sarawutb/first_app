import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constent.dart';

class Loading_conn_network extends StatelessWidget {
  const Loading_conn_network({Key? key,required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: size.width*0.6,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.withOpacity(0.3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CupertinoActivityIndicator(),
            Text("การเชื่อมต่อขาดหาย...",style: styleFontLable.copyWith(fontSize: 13),)
          ],
        ),
      ),
    );
  }
}