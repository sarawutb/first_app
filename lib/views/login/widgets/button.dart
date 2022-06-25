import 'package:flutter/material.dart';

import '../../../constent.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    this.press
  }) : super(key: key);
  final VoidCallback? press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: press,
      child: Container(
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
              color:  Colors.purple.shade900,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text("เข้าสู่ระบบ",
                  style: styleFontLable.copyWith(
                      color: Colors.white)),
              Spacer(),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )),
    );
  }
}
