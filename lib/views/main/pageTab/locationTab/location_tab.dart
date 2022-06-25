import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocationTab extends StatefulWidget {
  const LocationTab({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}