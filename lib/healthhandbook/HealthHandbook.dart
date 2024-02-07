import 'package:flutter/material.dart';

import '../utils/hextocolor.dart';

class HealthHandbookPage extends StatelessWidget {
  const HealthHandbookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {},
        ),
        title: const Text(
          '健康手册',
          style: TextStyle(color: Colors.black, fontSize: 19, height: 75),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        width: double.infinity,
        height: double.infinity,
        child: const HealthHandbookList(),
      ),
    );
  }
}

class HealthHandbookList extends StatelessWidget {
  const HealthHandbookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 15,
              color: HexToColor("#479CFF"),
              margin: const EdgeInsets.only(top: 15, left: 15, right: 8),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "日常护理",
                style: TextStyle(
                    fontSize: 14,
                    color: HexToColor("#222222"),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: HexToColor("#FFFFFF"), width: 1)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "1.备好床单位。根据患者病情做好准备工作，并通知医师。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "2.向患者进行自我介绍，妥善安置患者于病床。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "3.测量患者生命体征，了解患者的主诉、症状、自理能力、心理状况，填写患者入院相关资料。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "4.入院告知: 向患者/家属介绍主管医师护士、病区护士长。介绍病区环境、呼叫铃使用、作息时间、探视制度及有关管理规定等。鼓励患者/家属表达自己的需要及顾虑。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "5.完成入院护理评估，与医师沟通确定护理级别，遵医嘱实施相关治疗及护理。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Text(
                "6.完成患者清洁护理，协助更换病员服，完成患者身高、体重、生命体征的测量 (危重患者直接进入病房)。",
                style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: 3,
              height: 15,
              color: HexToColor("#479CFF"),
              margin: const EdgeInsets.only(top: 15, left: 15, right: 8),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                "应急处理",
                style: TextStyle(
                    fontSize: 14,
                    color: HexToColor("#222222"),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: HexToColor("#FFFFFF"), width: 1)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "1.备好床单位。根据患者病情做好准备工作，并通知医师。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "2.向患者进行自我介绍，妥善安置患者于病床。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "3.测量患者生命体征，了解患者的主诉、症状、自理能力、心理状况，填写患者入院相关资料。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "4.入院告知: 向患者/家属介绍主管医师护士、病区护士长。介绍病区环境、呼叫铃使用、作息时间、探视制度及有关管理规定等。鼓励患者/家属表达自己的需要及顾虑。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "5.完成入院护理评估，与医师沟通确定护理级别，遵医嘱实施相关治疗及护理。",
                  style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
                ),
              ),
              Text(
                "6.完成患者清洁护理，协助更换病员服，完成患者身高、体重、生命体征的测量 (危重患者直接进入病房)。",
                style: TextStyle(fontSize: 14, color: HexToColor("#333333")),
              )
            ],
          ),
        )
      ],
    ));
  }
}
