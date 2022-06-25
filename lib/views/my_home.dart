import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:first_app/views/login/login_view.dart';
import 'package:first_app/views/scollview.dart';
import 'package:first_app/widgets/button.dart';
import 'package:first_app/widgets/card.dart';
import 'package:first_app/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/covid_model.dart';
import '../constent.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = '/MyHomePage';
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _statusLoading = false;

  CovidModel? response;

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("MAIN"),
        centerTitle: true,elevation: 0,
        actions: [
          Icon(Icons.settings),
          Icon(Icons.notification_add_outlined),
          WidgetSizedBoxWidth()
        ],
      ),
      body: Center(
        child: _statusLoading == true
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CardWidget(
                        message: response?.newCase,
                        color: Colors.blue,
                        icon: Icons.location_city),
                    WidgetSizedBox(heigh: 20),
                    CardWidget(
                        message: response?.totalCase,
                        color: Colors.blue,
                        icon: Icons.ads_click),
                    WidgetSizedBox(heigh: 20),
                    CardWidget(
                        message: response?.totalDeath,
                        color: Colors.blue,
                        icon: Icons.aspect_ratio),
                    WidgetSizedBox(heigh: 20),
                    Row(
                      children: [
                        Expanded(
                          child: SimpleElevatedButton(
                            child: Text("SIGN IN"),
                            color: kButtonColor,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            onPressed: () {
                              initData();
                            },
                          ),
                        )
                      ],
                    ),
                     WidgetSizedBox(heigh: 20),
                    Row(
                      children: [
                        Expanded(
                          child: SimpleElevatedButton(
                            child: Text("NEXT PAGE"),
                            color: Colors.green,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (builder)=>Scollview()));
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  WidgetSizedBox(),
                  Text("is loading data...")
                ],
              ),
      ),
    );
  }

  Widget WidgetSizedBox({double? heigh, double? width}) =>
      SizedBox(height: heigh ?? heightDf);

 Widget WidgetSizedBoxWidth({double? heigh, double? width}) =>
      SizedBox(width: width ?? 20);


  void initData() async {
    setState(() {
      _statusLoading = false;
    });
    var responseHttp = await http.get(
        Uri.parse("https://covid19.ddc.moph.go.th/api/Cases/today-cases-all"));
    var responseJson = json.decode(utf8.decode(responseHttp.bodyBytes));
    response = CovidModel.fromMapJson(responseJson[0]);
    print(response);
    setState(() {
      _statusLoading = true;
    });
  }
}
