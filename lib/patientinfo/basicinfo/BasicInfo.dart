import "package:flutter/material.dart";

import "../../utils/HexToColor.dart";

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        width: double.infinity,
        height: double.infinity,
        child: const PatientBasicInfo(),
      ),
    );
  }
}

class PatientBasicInfo extends StatelessWidget {
  const PatientBasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "姓名：张三",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "assets/icon_user.png",
                          width: 29,
                          height: 29,
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "性别：男",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "血型：A型",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "年龄：65岁",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "身份证号：125614544646415",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "联系电话：15555555555",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "户籍：邯郸市丛台区古郡新都",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "护理级别：二级护理",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "入院时间：2022-05-05",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "床位号：315房7号床",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "亲属信息：张新生 15555555555",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
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
              height: 65,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "体检报告：",
                    style:
                        TextStyle(fontSize: 16, color: HexToColor("#333333")),
                  ),
                  Image.asset(
                    "assets/icon_pdf.png",
                    width: 32,
                    height: 38,
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
          ],
        )));
  }
}
