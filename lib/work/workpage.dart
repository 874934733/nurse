import 'package:flutter/material.dart';
import 'package:nurse/healthhandbook/HealthHandbook.dart';
import 'package:nurse/utils/hextocolor.dart';

import '../careplan/CarePlan.dart';
import '../changeshifts/ChangeShifts.dart';
import '../nursingrecords/NursingRecords.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "工作",
            style: TextStyle(color: Colors.black, fontSize: 19, height: 75),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        child: WorkList(),
      ),
    );
  }
}

class WorkList extends StatelessWidget {
  List listData = [
    {"title": "排班表", "image": "assets/icon_schedule.png"},
    {"title": "护理记录", "image": "assets/icon_nursing_records.png"},
    {"title": "交班管理", "image": "assets/icon_change_shifts.png"},
    {"title": "健康手册", "image": "assets/icon_health_handbook.png"},
    {"title": "床位查看", "image": "assets/icon_bed_view.png"},
    {"title": "护理计划", "image": "assets/icon_care_plan.png"},
    {"title": "患者评估", "image": "assets/icon_patient_assessment.png"},
    {"title": "扫一扫", "image": "assets/icon_scan.png"},
  ];

  WorkList({Key? key}) : super(key: key);

  List<Widget> _getData(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < listData.length; i++) {
      list.add(GestureDetector(
        onTap: () {
          switch (i) {
            case 0:
              break;
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NursingRecordsPage();
              }));
              break;
            case 2:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChangeShiftsPage();
              }));
              break;
            case 3:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HealthHandbookPage();
              }));
              break;
            case 4:
              break;
            case 5:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CarePlanPage();
              }));
              break;
            case 6:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CarePlanPage();
              }));
              break;
            case 7:
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CarePlanPage();
              }));
              break;
          }
        },
        child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  listData[i]["image"],
                  width: 50,
                  height: 50,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    listData[i]["title"],
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, color: HexToColor("#FF3A3A3A")),
                  ),
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
        child: GridView.count(
          childAspectRatio: 1 / 0.9,
          //设置滚动方向
          scrollDirection: Axis.vertical,
          //设置列数
          crossAxisCount: 2,
          //设置内边距
          // padding: const EdgeInsets.all(8),
          children: _getData(context),
        ));
  }
}
