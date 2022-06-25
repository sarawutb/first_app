import 'dart:async';
import 'dart:convert';

import 'package:first_app/app/appinfo.dart';
import 'package:first_app/constent.dart';
import 'package:first_app/models/goods.dart';
// import 'package:first_app/models/user.dart';
// import 'package:first_app/models/user.dart';
import 'package:first_app/services/services.dart';
import 'package:first_app/views/scollview.dart';
import 'package:first_app/widgets/SimpleTextFormInput.dart';
import 'package:first_app/widgets/loading.dart';
import 'package:first_app/widgets/snackber_message.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchGoods extends StatefulWidget {
  SearchGoods(
      {Key? key,
      required BuildContext context,
      required PageController controller,
      required int selectedIndex})
      : super(key: key);

  // TextEditingController _query = TextEditingController();

  @override
  State<SearchGoods> createState() => _SearchGoodsState();
}

class _SearchGoodsState extends State<SearchGoods> {
  List<Goods> _list = [];
  TextEditingController _query = TextEditingController();
  bool statusLoad = true;
  bool statusBlankd = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: SimpleTextFormInput(
                  controllerUserId: _query,
                  hintTex: "ค้นหาสินค้า",
                  textInputType: TextInputType.number,
                  onChanged: (value) {
                    print("ok");
                    setState(() {
                      search_goods();
                      _list = [];
                    });
                  },
                  // press: () => {
                  //   setState(() {
                  //     search_goods();
                  //   }),
                  // },
                  suffixIcon: Ionicons.search,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.barcode_outline,
                    size: 35,
                  ),
                  Text(
                    "สแกน",
                    style: styleFontLable.copyWith(fontSize: 10),
                  )
                ],
              )
            ],
          )),
      Expanded(
          child: Container(
        alignment: Alignment.topCenter,
        // color: Colors.black87,
        child: statusLoad == false
            ? Loading(
                size: _size,
              )
            : statusBlankd == false
                ? blank_search(
                    // size: _size,
                    )
                : SingleChildScrollView(
                    child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        ...List.generate(_list.length, (index) {
                          var itemcode = _list[index].itemcode;
                          var itemname = _list[index].itemname;
                          var barcode = _list[index].barcode;
                          var unitname = _list[index].unitname;
                          var unitcode = _list[index].unitcode;
                          // List<BranchList>? branchList = userInfo!.branchList!;
                          return GestureDetector(
                            onTap: () => {
                              print(index),
                            },
                            child: Container(
                              // alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 20),
                              height: _size.height * 0.265,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      width: 120,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                          'https://picsum.photos/250?image=${index}'),
                                    ),
                                  ),

                                  // padding: const EdgeInsets.only(top: 15),
                                  // child: Column(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Container(
                                  //       child: Text(itemcode.toString(),
                                  //           style: styleFontHeader.copyWith(
                                  //               fontSize: 13,
                                  //               color: Colors.red)),
                                  //     ),
                                  //     Container(
                                  //       alignment: Alignment.topLeft,
                                  //       width: _size.width * 0.5,
                                  //       child: Padding(
                                  //         padding:
                                  //             const EdgeInsets.only(top: 10),
                                  //         child: new Column(
                                  //           children: <Widget>[
                                  //             new Text(
                                  //               itemname.toString(),
                                  //               textAlign: TextAlign.left,
                                  //               style: styleFontLable
                                  //                   .copyWith(fontSize: 10),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Container(
                                  //       alignment: Alignment.topLeft,
                                  //       width: _size.width * 0.5,
                                  //       child: Padding(
                                  //         padding:
                                  //             const EdgeInsets.only(top: 10),
                                  //         child: new Column(
                                  //           children: <Widget>[
                                  //             new Text(
                                  //               unitcode.toString()+"/"+unitname.toString(),
                                  //               textAlign: TextAlign.left,
                                  //               style: styleFontLable
                                  //                   .copyWith(fontSize: 13),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Container(
                                  //       alignment: Alignment.topLeft,
                                  //       width: _size.width * 0.5,
                                  //       child: Padding(
                                  //         padding:
                                  //             const EdgeInsets.only(top: 6),
                                  //         // ignore: unnecessary_new
                                  //         child: new Row(
                                  //           children: <Widget>[
                                  //             Container(
                                  //               child: Icon(
                                  //                   Ionicons.barcode_sharp),
                                  //             ),
                                  //             Container(
                                  //               padding:
                                  //                   EdgeInsets.only(left: 3),
                                  //               child: Text(
                                  //                 barcode.toString(),
                                  //                 textAlign: TextAlign.left,
                                  //                 style: styleFontLable
                                  //                     .copyWith(fontSize: 13),
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.only(top: 5),
                                          alignment: Alignment.topLeft,
                                          child: Text(itemcode.toString(),
                                              style: styleFontHeader.copyWith(
                                                  fontSize: 13,
                                                  color: Colors.red)),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                            width: _size.width * 0.5,
                                            child: Text(
                                              itemname.toString(),
                                              textAlign: TextAlign.left,
                                              style: styleFontLable.copyWith(
                                                  fontSize: 12),
                                            ),
                                          )),
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Container(
                                      //       alignment: Alignment.topLeft,
                                      //       child: Text(
                                      //         unitcode.toString() +
                                      //             "/" +
                                      //             unitname.toString(),
                                      //         textAlign: TextAlign.left,
                                      //         style: styleFontLable.copyWith(
                                      //             fontSize: 13),
                                      //       )),
                                      // ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  unitcode.toString() +
                                                      "/" +
                                                      unitname.toString(),
                                                  textAlign: TextAlign.left,
                                                  style: styleFontLable
                                                      .copyWith(fontSize: 13),
                                                )),
                                            Container(
                                              // margin: EdgeInsets.only(bottom: 10),
                                              alignment: Alignment.topLeft,
                                              child: new Row(children: <Widget>[
                                                Container(
                                                  child: Icon(
                                                      Ionicons.barcode_sharp),
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 3),
                                                  child: Text(
                                                    barcode.toString(),
                                                    textAlign: TextAlign.left,
                                                    style: styleFontLable
                                                        .copyWith(fontSize: 13),
                                                  ),
                                                ),
                                              ]),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  )),
      ))
    ]);
  }

  Widget blank_search() {
    // TODO: implement test
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Text(
            "ไม่พบข้อมูล",
            style: styleFontHeader.copyWith(fontSize: 20),
          ),
        )
      ],
    );
  }

  // ignore: dead_code
  Future<void> search_goods() async {
    print("in");
    setState(() {
      statusLoad = false;
    });
    String? token = userInfo!.token;
    try {
      String url =
          'https://localapi.homeone.co.th/erp/v1/icapp/ProductSearch/?dbid=0&s=' +
              _query.text.trim();
      final reponse = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      var responseJson = json.decode(utf8.decode(reponse.bodyBytes));

      // final response = await http.get(Uri.parse(url), );
      if (reponse.statusCode == 200) {
        _list = (responseJson["data"] as List)
            .map((e) => Goods.fromJson(e))
            .toList();
        print(_list.length);
        print(reponse.statusCode);
      } else if (reponse.statusCode == 400) {
        print(reponse.statusCode);
        _list = [];
        print("NotSearch");
        blank_search();
      }
      setState(() {
        statusLoad = true;
      });
    } on TimeoutException catch (e) {
      //  print('Timeout');
      setState(() {
        _list = [];
        statusLoad = true;
      });
      print("finish");
    } catch (e) {
      setState(() {
        print("NotSearch");
        blank_search();
        _list = [];
        statusLoad = true;
      });
    }
  }
}
