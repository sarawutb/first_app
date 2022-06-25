import 'package:flutter/material.dart';

class WidgetSizedBoxHeight extends StatelessWidget {
  const WidgetSizedBoxHeight({
    this.height,
    Key? key,
  }) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20,
    );
  }
}