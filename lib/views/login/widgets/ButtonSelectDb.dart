import 'package:flutter/material.dart';

import '../../../constent.dart';

class ButtonSelectDb extends StatelessWidget {
  const ButtonSelectDb({Key? key, this.press, required this.db_name})
      : super(key: key);
  final VoidCallback? press;
  final String db_name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
              color: Color(0xAAE6E6E6),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Text(db_name, style: styleFontLable.copyWith(color: Colors.black)),
              Spacer(),
              Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
            ],
          )),
    );
  }
}
