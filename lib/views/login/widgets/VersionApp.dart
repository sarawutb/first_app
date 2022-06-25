import 'package:flutter/material.dart';

class VersionApp extends StatelessWidget {
  const VersionApp({
    Key? key,
    required Size size,
    required this.version,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String version;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      child: Text(version),
      );
  }
}
