import 'package:flutter/material.dart';

import 'widgets/box_menu.dart';

// Widget HomePage({required BuildContext context,required PageController controller,required int selectedIndex}) {

//   Map<String, dynamic> _list = {
//     "menu": [
//       {
//         "title": "เช็คราคาสินค้า",
//         "imagePath": "assets/images/undraw1.png",
//         "press": () {
//           controller.animateToPage(selectedIndex,
//           duration: Duration(milliseconds: 400), curve: Curves.easeInCirc);
//         },
//       },
//       {
//         "title": "ผูกตำแหน่ง",
//         "imagePath": "assets/images/undraw2.png",
//         "press": () {
//           print("2");
//         },
//       },
//       {
//         "title": "เมนูสำหรับอนาคต",
//         "imagePath": "assets/images/undraw3.png",
//         "press": () {
//           print("3");
//         },
//       },
//       {
//         "title": "เมนูสำหรับอนาคต",
//         "imagePath": "assets/images/undraw4.png",
//         "press": () {
//           print("4");
//         },
//       }
//     ]
//   };

//   return ;

// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.controller}) : super(key: key);
  final PageController controller;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> _list = {
    "menu": [
      {
        "title": "เช็คราคาสินค้า",
        "imagePath": "assets/images/undraw",
      },
      {
        "title": "ผูกตำแหน่งสินค้า",
        "imagePath": "assets/images/undraw",
      },
      {
        "title": "เมนูสำหรับอนาคต",
        "imagePath": "assets/images/undraw",
      },
      {
        "title": "เมนูสำหรับอนาคต",
        "imagePath": "assets/images/undraw",
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: (_list["menu"] as List).length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () {
                    switch (index) {
                      case 0:
                        widget.controller.animateToPage(index + 1,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeInCirc);

                        break;
                      case 1:
                        widget.controller.animateToPage(index + 1,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeInCirc);
                        break;

                      default:
                        setState(() {});
                    }
                  },
                  child: MenuBox(
                      title: _list["menu"][index]["title"],
                      imagePath: _list["menu"][index]["imagePath"] +
                          '${index + 1}.png'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
