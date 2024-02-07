import 'package:flutter/material.dart';
import 'package:nurse/patientinfo/basicinfo/BasicInfo.dart';
import 'package:nurse/patientinfo/healthdata/HealthData.dart';
import 'package:nurse/patientinfo/nurserecords/NurseRecords.dart';
import 'package:nurse/patientinfo/schedule/ScheduleInfo.dart';
import 'package:nurse/utils/hextocolor.dart';

class PatientInfo extends StatefulWidget {
  const PatientInfo({Key? key}) : super(key: key);

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo>
    with TickerProviderStateMixin {
  List<Tab> tabs = [
    const Tab(
      text: '基本信息',
    ),
    const Tab(
      text: "日程安排",
    ),
    const Tab(
      text: "健康数据",
    ),
    const Tab(
      text: "护理记录",
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "张三",
            style: TextStyle(
                color: HexToColor("#3A3A3A"),
                fontSize: 19,
                fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Theme(
              data: ThemeData(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent),
              child: TabBar(
                tabs: tabs,
                labelColor: HexToColor("#477CE8"),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontSize: 15),
                unselectedLabelColor: HexToColor("#333333"),
                controller: _tabController,
              ),
            ),
          ),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        ),
        body: Container(
          color: HexToColor("#F7F8FC"),
          child: TabBarView(
            controller: _tabController,
            children: const [
              BasicInfo(),
              ScheduleInfo(),
              HealthData(),
              NurseRecords(),
            ],
          ),
        ));
  }
}
