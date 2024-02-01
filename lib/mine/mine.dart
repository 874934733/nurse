import 'package:flutter/material.dart';
import 'package:nurse/messagelist/MessageList.dart';
import 'package:nurse/nursingrecords/NursingRecords.dart';

import '../healthhandbook/HealthHandbook.dart';
import '../personalinfo/PersonalInfo.dart';
import '../utils/HexToColor.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: HexToColor("#F7F8FC"),
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      children: [
                        Image.asset(
                          width: double.infinity,
                          "assets/icon_mine.png",
                          fit: BoxFit.fill, // 完全填充
                          height: 150,
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 45),
                            child: const SizedBox(
                              width: double.infinity,
                              child: Text(
                                "我的",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 19, color: Colors.white),
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 85, left: 15, right: 15),
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: HexToColor("#E4E4E4"), width: 1)),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 6),
                                child: Image.asset(
                                  "assets/icon_user.png",
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, bottom: 5),
                                    child: Text("张三",
                                        style: TextStyle(
                                            color: HexToColor("#333333"),
                                            fontSize: 16)),
                                  ),
                                  Text("15222222222",
                                      style: TextStyle(
                                          color: HexToColor("#666666"),
                                          fontSize: 12))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  margin: const EdgeInsets.only(left: 16),
                  child: Text(
                    "常用工具",
                    style:
                        TextStyle(color: HexToColor("#333333"), fontSize: 15),
                  ),
                ),
                Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const NursingRecordsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: Image.asset(
                                    "assets/icon_schedule.png",
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                Text(
                                  "排班表",
                                  style: TextStyle(
                                      color: HexToColor("#333333"),
                                      fontSize: 14),
                                ),
                              ],
                            )),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const NursingRecordsPage();
                              }));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, bottom: 10),
                                  child: Image.asset(
                                    "assets/icon_nursing_records.png",
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                Text(
                                  "护理记录",
                                  style: TextStyle(
                                      color: HexToColor("#333333"),
                                      fontSize: 14),
                                ),
                              ],
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HealthHandbookPage();
                            }));
                          },
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                child: Image.asset(
                                  "assets/icon_health_handbook.png",
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              Text(
                                "健康手册",
                                style: TextStyle(
                                    color: HexToColor("#333333"), fontSize: 14),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 16),
                        child: Text(
                          "其他服务",
                          style: TextStyle(
                              color: HexToColor("#333333"), fontSize: 15),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const MessageListPage();
                            }));
                          },
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Image.asset(
                                        "assets/icon_message.png",
                                        width: 17,
                                        height: 17,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "我的消息",
                                        style: TextStyle(
                                            color: HexToColor("#333333"),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: HexToColor("E91010"),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: HexToColor("#E91010"),
                                              width: 1)),
                                      margin: const EdgeInsets.only(right: 14),
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5, top: 2, bottom: 2),
                                      child: const Text(
                                        "8",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 9),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 20),
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
                          )),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Divider(
                          color: HexToColor("#F6F6F6"),
                          height: 1,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const PersonalInfoPage();
                            }));
                          },
                          child: SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 20),
                                      child: Image.asset(
                                        "assets/icon_personal_info.png",
                                        width: 17,
                                        height: 17,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Text(
                                        "个人信息",
                                        style: TextStyle(
                                            color: HexToColor("#333333"),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 20),
                                  child: Image.asset(
                                    "assets/icon_right_arrow.png",
                                    width: 8,
                                    height: 14,
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            )));
  }
}
