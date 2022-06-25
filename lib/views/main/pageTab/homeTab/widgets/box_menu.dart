import 'package:first_app/constent.dart';
import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  const MenuBox({
    Key? key,
    required this.imagePath,
    required this.title,

  }) : super(key: key);

  final String imagePath;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black87,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          Text(
            title,
            style: styleFontHeader.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
