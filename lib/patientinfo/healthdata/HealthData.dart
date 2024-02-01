import "package:flutter/material.dart";
import "package:nurse/healthhistory/HealthHistory.dart";

import "../../utils/HexToColor.dart";

class HealthData extends StatelessWidget {
  const HealthData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        color: HexToColor("#F7F8FC"), // 设置容器的颜色
      ),
      child: HealthDataList(),
    ));
  }
}

class HealthDataList extends StatelessWidget {
  List listData = [
    {"title": "身高：165cm", "image": "assets/icon_height.png"},
    {"title": "体重：60kg", "image": "assets/icon_weight.png"},
    {"title": "心率：76次/分钟", "image": "assets/icon_heart_rate.png"},
    {"title": "血压：150/85", "image": "assets/icon_blood_pressure.png"},
    {"title": "血糖：100mmol/L", "image": "assets/icon_blood_sugar.png"},
  ];

  HealthDataList({super.key});

  List<Widget> _getData(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < listData.length; i++) {
      list.add(GestureDetector(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 15, top: 15),
                      child: Image.asset(
                        "assets/icon_edit_info.png",
                        width: 14,
                        height: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      listData[i]["image"],
                      width: 48,
                      height: 48,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        listData[i]["title"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, color: HexToColor("#333333")),
                      ),
                    )
                  ],
                )
              ],
            )),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: GridView.count(
                  childAspectRatio: 1 / 0.9,
                  //设置滚动方向
                  scrollDirection: Axis.vertical,
                  //设置列数
                  crossAxisCount: 2,
                  children: _getData(context),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HealthHistoryPage();
                  }));
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: Center(
                    child: Text(
                      "历史记录",
                      style:
                          TextStyle(color: HexToColor("#666666"), fontSize: 14),
                    ),
                  ),
                ))
          ],
        ));
  }
}
