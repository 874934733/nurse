import 'package:flutter/material.dart';

import '../utils/hextocolor.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {},
        ),
        title: const Text(
          '个人信息',
          style: TextStyle(color: Colors.black, fontSize: 19, height: 75),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        child: const PersonalInfo(),
      ),
    );
  }
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: HexToColor("#F7F8FC"),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.only(left: 21, right: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "头像",
                        style: TextStyle(
                            fontSize: 16, color: HexToColor("#333333")),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_user.png",
                            width: 46,
                            height: 46,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              "assets/icon_right_arrow.png",
                              width: 8,
                              height: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    color: HexToColor("#F6F6F6"),
                    height: 1,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 21, right: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "用户名",
                        style: TextStyle(
                            fontSize: 16, color: HexToColor("#333333")),
                      ),
                      Row(
                        children: [
                          Text("张三",
                              style: TextStyle(
                                  fontSize: 16, color: HexToColor("#666666"))),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              "assets/icon_right_arrow.png",
                              width: 8,
                              height: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    color: HexToColor("#F6F6F6"),
                    height: 1,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 21, right: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "手机号",
                        style: TextStyle(
                            fontSize: 16, color: HexToColor("#333333")),
                      ),
                      Row(
                        children: [
                          Text("15222222222",
                              style: TextStyle(
                                  fontSize: 16, color: HexToColor("#666666"))),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              "assets/icon_edit_info.png",
                              width: 14,
                              height: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Divider(
                    color: HexToColor("#F6F6F6"),
                    height: 1,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  color: Colors.white,
                  padding: const EdgeInsets.only(left: 21, right: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "头像",
                        style: TextStyle(
                            fontSize: 16, color: HexToColor("#333333")),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              "assets/icon_lock.png",
                              width: 14,
                              height: 14,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text("******",
                              style: TextStyle(
                                  fontSize: 16, color: HexToColor("#666666"))),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              "assets/icon_edit_info.png",
                              width: 14,
                              height: 14,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
