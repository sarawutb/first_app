import 'dart:async';

import 'package:first_app/app/appinfo.dart';
import 'package:first_app/constent.dart';
import 'package:first_app/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../widgets/loading.dart';
import 'pageTab/homeTab/hometab.dart';
import 'pageTab/locationTab/location_tab.dart';
import 'pageTab/searchTab/search_tab.dart';

class MainView extends StatefulWidget {
  static const String routeName = 'MainView';
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  bool statusLoad = true;
  late Timer _timer;
  int _start = 1;
  @override
  void initState() {
    startTimer();
    // statusLoad = false;
    super.initState();
  }

  PageController controller = PageController(initialPage: 0);
  // List<Widget > views = [
  //   Container(color: Colors.red,child: SearchGoods()),
  //   Container(color: Colors.black,child: Text("2",style: styleFontHeader.copyWith(fontSize: 50),)),
  //   Container(color: Colors.pink,child: Text("3",style: styleFontHeader.copyWith(fontSize: 50),)),
  //   Container(color: Colors.yellow,child: Text("4",style: styleFontHeader.copyWith(fontSize: 50),)),
  // ];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (() async {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext ctx) => AlertDialog(
                  content: Text("คุณต้องการออกจากระบบหรือไม่ ?",
                      textAlign: TextAlign.center, style: styleFontLable),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ยกเลิก",
                          style: styleFontLable.copyWith(color: Colors.red),
                        )),
                    TextButton(
                        onPressed: () {
                          userInfo = null;
                          print(userInfo);
                          Navigator.pushNamedAndRemoveUntil(
                              context, LoginView.routeName, (route) => false);
                        },
                        child: Text(
                          "ตกลง",
                          style: styleFontLable.copyWith(color: Colors.blue),
                        ))
                  ],
                ));
        return false;
      }),
      child: statusLoad == true
          ? Loading(
              size: _size,
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0, //เงา
                // leading: Container(
                //   margin: const EdgeInsets.only(left: heightDf - 15),
                //   child: SizedBox(
                //     width: 100,
                //     height: 100,
                //     child: Image.asset(
                //       "assets/images/logo.jpeg",
                //     ),
                //   ),
                // ),
                title: Container(
                  // padding: const EdgeInsets.only(right: heightDf - 10),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/images/logo.jpeg",scale: 5,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Ionicons.person_circle,
                        color: Colors.black,
                      ))
                ],
                // title: Text('example'),
              ),
              body: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(), //ปิดเลื่อน
                  controller: controller,
                  onPageChanged: _onPageChanged,
                  children: [
                    Container(
                        color: Colors.grey.shade900,
                        child: HomePage(controller: controller)),
                    Container(
                        color: Colors.white,
                        child: SearchGoods(
                            context: context,
                            controller: controller,
                            selectedIndex: _selectedIndex)),
                    Container(
                        color: Colors.white,
                        child: LocationTab(controller: controller)),
                    // Text(
                    //   "3",
                    //   style: styleFontHeader.copyWith(fontSize: 50),
                    // )
                    Container(
                        color: Colors.yellow,
                        child: Text(
                          "4",
                          style: styleFontHeader.copyWith(fontSize: 50),
                        )),
                  ],
                ),
              ),
              backgroundColor: Colors.purple.shade900,
              bottomNavigationBar: _navButtonBar(),
            ),
    );
  }

  SalomonBottomBar _navButtonBar() {
    return SalomonBottomBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        SalomonBottomBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: Text("หน้าหลัก"),
            selectedColor: Colors.orange,
            activeIcon: Icon(Icons.home, color: Colors.orange)),
        SalomonBottomBarItem(
            icon: Icon(Icons.search, color: Colors.white),
            title: Text("ค้นหาสินค้า"),
            selectedColor: Colors.orange,
            activeIcon: Icon(Icons.search, color: Colors.orange)),
        SalomonBottomBarItem(
            icon: Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            title: Text("ตำแหน่งสินค้า"),
            selectedColor: Colors.orange,
            activeIcon: Icon(Icons.location_on, color: Colors.orange)),
        SalomonBottomBarItem(
            icon: Icon(Ionicons.person_circle, color: Colors.white),
            title: Text("โปรไฟล์"),
            selectedColor: Colors.orange,
            activeIcon: Icon(Ionicons.person_circle, color: Colors.orange)),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controller.animateToPage(_selectedIndex,
          duration: Duration(milliseconds: 100), curve: Curves.easeInCirc);
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            statusLoad = false;
            timer.cancel();
          });
        } else {
          setState(() {
            // statusLoad = false;
            _start--;
          });
        }
      },
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
