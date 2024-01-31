import 'package:flutter/material.dart';
import 'package:nurse/patientinfo/basicinfo/BasicInfo.dart';
import 'package:nurse/patientinfo/healthdata/HealthData.dart';
import 'package:nurse/patientinfo/nurserecords/NurseRecords.dart';
import 'package:nurse/patientinfo/schedule/ScheduleInfo.dart';
import 'package:nurse/utils/HexToColor.dart';

class PatientInfo extends StatefulWidget {
  const PatientInfo({Key? key}) : super(key: key);

  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "张三",
              style: TextStyle(
                  color: HexToColor("#3A3A3A"), fontSize: 19, height: 75),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              color: HexToColor("#F7F8FC"),
              width: double.infinity,
              child: TabBar(
                //标记是否为滚动模式
                isScrollable: false,
                //与TabBarView绑定的纽带
                controller: tabController,
                //定义tab的item,其中tabs中的item为widget类型,可自定义
                tabs: [
                  Container(
                    color: Colors.white,
                    child: Text(
                      "首页",
                      style: TextStyle(
                          color: HexToColor("#333333"), fontSize: 16, height: 50),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text(
                      "首页",
                      style: TextStyle(
                          color: HexToColor("#333333"), fontSize: 16, height: 50),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text(
                      "首页",
                      style: TextStyle(
                          color: HexToColor("#333333"), fontSize: 16, height: 50),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text(
                      "首页",
                      style: TextStyle(
                          color: HexToColor("#333333"), fontSize: 16, height: 50),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.red,
              height: 200,
              child: TabBarView(
                controller: tabController,
                children: const <Widget>[
                  BasicInfo(),
                  HealthData(),
                  ScheduleInfo(),
                  NurseRecords(),
                ],
              ),
            ),
          ],
        ));
  }
}
