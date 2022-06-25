import 'package:first_app/views/login/login_view.dart';
import 'package:flutter/material.dart';

import 'views/main/main_view.dart';
import 'views/my_home.dart';
import 'views/select_branch/select_branch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Homeone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LoginView.routeName,
      routes: {
        MyHomePage.routeName:(context)=>MyHomePage(title: "title"),
        LoginView.routeName:(context)=>LoginView(),
        SelectBranch.routeName:(context)=>SelectBranch(),
        MainView.routeName:(context)=>MainView(),
        // Scollview.routeName:(context)=>Scollview(),
        // Btn_navigation.routeName:(context)=>Btn_navigation(),
      },
    );
  }
}

