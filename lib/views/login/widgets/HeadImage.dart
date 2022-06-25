import 'package:flutter/material.dart';

class HeadImage extends StatelessWidget {
  const HeadImage({
    Key? key,
    required Size size,
  }) : _size = size, super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: _size.width*0.6,
      child: Image.asset(
            "assets/images/logo.jpeg",
            fit: BoxFit.contain,
          )
    );
  }
}
