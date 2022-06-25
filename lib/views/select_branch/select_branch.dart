import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:first_app/app/appinfo.dart';
import 'package:flutter/material.dart';

import '../../constent.dart';
import '../../models/user.dart';
import '../../widgets/loading.dart';
import '../../widgets/loading_conn_network.dart';
import '../main/main_view.dart';

class SelectBranch extends StatefulWidget {
  static const String routeName = '';
  const SelectBranch({Key? key}) : super(key: key);
  @override
  State<SelectBranch> createState() => _SelectBranchState();
}

class _SelectBranchState extends State<SelectBranch> {
  ConnectivityResult? _connectivityResult;
  late StreamSubscription _connectivitySubscription;
  bool statusLoad = true;
  bool hasConnection = true;
  late Timer _timer;
  int _start = 2;


  StreamController connectionChangeController =
      new StreamController.broadcast();

  @override
  initState() {
    _checkConnectivityState();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: !statusLoad
          ? Loading_conn_network(
              size: _size,
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            top: 20, bottom: 5, right: 20, left: 20),
                        alignment: Alignment.center,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.purple.shade900,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text("เลือกสาขา",
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
                    ...List.generate(userInfo!.branchList!.length, (index) {
                      List<BranchList>? branchList = userInfo!.branchList!;

                      return GestureDetector(
                        onTap: () => {
                          userInfo!.selctBranch = branchList[index],
                          Navigator.pushNamedAndRemoveUntil(
                              context, MainView.routeName, (route) => false)
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, right: 20, left: 20),
                            alignment: Alignment.center,
                            height: 60,
                            decoration: BoxDecoration(
                                color: kbgColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text("${branchList[index].branchname}",
                                    style: styleFontLable.copyWith(
                                        color: Colors.black87)),
                                Spacer(),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black87,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            )),
                      );
                    })
                  ],
                ),
              ),
            ),
    );
  }

  //เช็คเชื่อมต่ออินเทอร์เน็ต
  Future<void> _checkConnectivityState() async {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      print('Current connectivity status: $result');
      _connectivityResult = result;
      if (result == ConnectivityResult.wifi) {
        print('Connected to a Wi-Fi network');
        setState(() async {
          try {
            final result = await InternetAddress.lookup('example.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              setState(() {
                statusLoad = true;
                print('Connected Internet');
              });
            }
          } on SocketException catch (_) {
            setState(() {
              statusLoad = false;
              print('Not Connected Internet');
            });
          }
        });
      } else if (result == ConnectivityResult.mobile) {
        print('Connected to a mobile network');
        setState(() async {
          try {
            final result = await InternetAddress.lookup('example.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              setState(() {
                statusLoad = true;
                print('Connected Internet');
              });
            }
          } on SocketException catch (_) {
            setState(() {
              statusLoad = false;
              print('Not Connected Internet');
            });
          }
        });
      } else {
        print('Not connected to any network');
        setState(() {
          statusLoad = false;
        });
      }
    });
  }
  
}
