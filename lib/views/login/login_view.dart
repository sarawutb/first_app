import 'dart:convert';

import 'package:first_app/app/appinfo.dart';
import 'package:first_app/views/select_branch/select_branch.dart';
import 'package:first_app/widgets/SimpleTextFormInput.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../models/user.dart';
import '../../services/services.dart';
import '../../widgets/loading.dart';
import '../../widgets/widgetSizedBoxHeight.dart';
import 'widgets/HeadImage.dart';
import 'widgets/VersionApp.dart';
import 'widgets/button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/login';
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _controllerUserId = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool showPassword = true;
  bool statusLoad = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerUserId.dispose();
    super.dispose();
  }

  void onChangeValue() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: !statusLoad
          ? Loading(
              size: _size,
            )
          : SafeArea(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                width: _size.width,
                height: _size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const WidgetSizedBoxHeight(height: 60),                  
                      HeadImage(size: _size),
                      const WidgetSizedBoxHeight(height: 60),   
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            // color: Colors.red,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  SimpleTextFormInput(
                                    controllerUserId: _controllerUserId,
                                    hintTex: "รหัสพนักงาน",
                                    textInputType: TextInputType.number,
                                  ),
                                  const WidgetSizedBoxHeight(),
                                  SimpleTextFormInput(
                                    controllerUserId: _controllerPassword,
                                    suffixIcon: Ionicons.eye_outline,
                                    hintTex: "รหัสผ่าน",
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: showPassword,
                                    press: () {
                                      onChangeValue();
                                    },
                                  ),
                                  const WidgetSizedBoxHeight(),
                                  ButtonLogin(
                                    press: () async {
                                      await login();
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),          
                     const WidgetSizedBoxHeight(height: 60),      
                      Container(
                        // alignment: Alignment.bottomCenter,
                        // height: _size.height*0.2,
                        // color: Colors.yellowAccent,
                        child: VersionApp(size: _size, version: "V 1.0.1"),
                      ),  
                    //  const  WidgetSizedBoxHeight(height: 80),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<void> login() async {
    // if (_controllerUserId.text.isEmpty || _controllerPassword.text.isEmpty) {
    //   Fluttertoast.showToast(msg: "กรุณากรอกข้อมูลให้ครบ");
    //   return;
    // }

    setState(() {
      statusLoad = false;
    });
    var body = {
      // "userid": _controllerUserId.text.trim(),
      // "password": _controllerPassword.text.trim()
      "userid": "12083",
      "password": "12083"
    };
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    ServiceHttp.psttHttpResponse(
            uri:
                "https://localapi.homeone.co.th/erp/v1/icapp/user/login?dbid=0&app_name=wms",
            body: body,
            header: headers)
        .then((reponse) {
      if (reponse.statusCode == 200) {
        // Fluttertoast.showToast(msg: "เข้าสู่ระบบ");
        var responseJson = json.decode(utf8.decode(reponse.bodyBytes));
        // ScaffoldMessenger.of(context).showSnackBar(listSnakber[1]);
        userInfo = User.fromJson(responseJson["data"]);
        // print(userInfo!.token);
        // if (userInfo != null) {
        //   print(userInfo!.fullName ?? 'name');
        // }
        Navigator.pushNamedAndRemoveUntil(context, SelectBranch.routeName, (route) => false);
      } else if (reponse.statusCode == 401) {
        // Fluttertoast.showToast(msg: "รหัสพนักงานหรือรหัสผ่านไม่ถูกต้อง");

        // ScaffoldMessenger.of(context).showSnackBar(listSnakber[0]);
      }
    }).catchError((e) {
      throw Exception(e);
    }).whenComplete(() => setState(() {
              statusLoad = true;
            }));
  }
}

class SnackbarMessesge extends StatelessWidget {
  const SnackbarMessesge({
    Key? key,
    required this.message,
    required this.title,
  }) : super(key: key);

  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.failure,
      ),
    );
  }
}
