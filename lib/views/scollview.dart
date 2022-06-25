import 'dart:convert';

import 'package:first_app/models/list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Scollview extends StatefulWidget {
  const Scollview({Key? key}) : super(key: key);
  static const String routeName = '/Scollview';

  @override
  State<Scollview> createState() => _ScollviewState();
}

class _ScollviewState extends State<Scollview> {
  bool _statusLoading = false;
  List<ListModel> _list = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(
                _list.length,
                (index) => Row(
                      children: [
                        Text(_list[index].province ?? 'อำเภอ'),
                        Text("::"),
                        Text(_list[index].updateDate.toString()),
                      ],
                    )),
          )),
    );
  }

  void initData() async {
    setState(() {
      _statusLoading = false;
    });
    var responseHttp = await http.get(Uri.parse(
        "https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces"));
    var responseJson = json.decode(utf8.decode(responseHttp.bodyBytes));
    print(responseJson);
    _list = (responseJson as List).map((e) => ListModel.fromJson(e)).toList();
    setState(() {
      _statusLoading = true;
    });
  }
}
