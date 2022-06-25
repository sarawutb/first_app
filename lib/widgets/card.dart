import 'package:first_app/constent.dart';
import 'package:flutter/material.dart';


class CardWidget extends StatelessWidget {
  const CardWidget({Key? key,this.color,this.icon,this.message}) : super(key: key);
  final Color ? color;
  final String ? message;
  final IconData ? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color??kButtonColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            spreadRadius: 2,
            offset: Offset(1, 2)
          )
        ]
      ),
      height: 130,width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(icon??Icons.wind_power,color: Colors.white,size: 80,)),Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: heightDf),
                child: Text(message??"Title",style: styleFontHeader.copyWith(color: Colors.white)),
              ),
            )),Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: heightDf),
                child: Text(message??"Title",style: styleFontHeader.copyWith(color: Colors.white)),
              ),
            ))
        ],
      ),
      );
  }
}