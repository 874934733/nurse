import "package:flutter/material.dart";
import "package:nurse/patientinfo/schedule/utils.dart";
import "package:nurse/utils/hextocolor.dart";
import "package:table_calendar/table_calendar.dart";

class ScheduleInfo extends StatelessWidget {
  const ScheduleInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TimeCalendar(),
    );
  }
}

class TimeCalendar extends StatefulWidget {
  const TimeCalendar({super.key});

  @override
  _TimeCalendarState createState() => _TimeCalendarState();
}

class _TimeCalendarState extends State<TimeCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: HexToColor("#F7F8FC"),
            ),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: 120,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "2024年2月",
                                style: TextStyle(
                                    color: HexToColor("#333333"), fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        TableCalendar(
                          firstDay: kFirstDay,
                          lastDay: kLastDay,
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          headerVisible: false,
                          selectedDayPredicate: (day) {
                            // Use `selectedDayPredicate` to determine which day is currently selected.
                            // If this returns true, then `day` will be marked as selected.

                            // Using `isSameDay` is recommended to disregard
                            // the time-part of compared DateTime objects.
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDay, selectedDay)) {
                              // Call `setState()` when updating the selected day
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              // Call `setState()` when updating calendar format
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            // No need to call `setState()` here
                            _focusedDay = focusedDay;
                          },
                        )
                      ],
                    )),
                const Expanded(
                  child: NursingRecordsList(),
                )
              ],
            )));
  }
}

class NursingRecordsList extends StatefulWidget {
  const NursingRecordsList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NursingRecordsListState();
  }
}

class _NursingRecordsListState extends State<NursingRecordsList> {
  // ListView数据集合
  final _list = List.generate(10, (i) => '原始数据${i + 1}');
  late ScrollController _scrollController;
  bool isLoading = false; // 是否正在加载更多

  @override
  void initState() {
    super.initState();
    // 初始化ScrollController
    _scrollController = ScrollController();
    // 监听ListView是否滚动到底部
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        // 这里可以执行上拉加载逻辑
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Container(
            color: HexToColor("#F7F8FC"),
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index < _list.length) {
                  return ListTile(
                    title: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(
                          bottom: 16, left: 15, right: 15),
                      child: Column(
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: false,
                                        onChanged: (value) {
                                          //setState更新值
                                          setState(() {});
                                        },
                                      ),
                                      Text(
                                        '输液',
                                        style: TextStyle(
                                            color: HexToColor("#333333"),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "10:32",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: HexToColor("#333333")),
                                  ),
                                ],
                              )),
                          Container(
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: Text(
                                "占位占位占位占位占位占位占位；",
                                style: TextStyle(
                                    fontSize: 14, color: HexToColor("#333333")),
                              )),
                        ],
                      ),
                    ),
                  );
                } else {
                  // 最后一项，显示加载更多布局
                  return _buildLoadMoreItem();
                }
              },
              itemCount: _list.length + 1,
              controller: _scrollController,
            ),
          )),
    );
  }

  // 加载更多布局
  Widget _buildLoadMoreItem() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("加载中..."),
      ),
    );
  }

  // 下拉刷新方法
  Future<Null> _handleRefresh() async {
    // 模拟数据的延迟加载
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        // 在列表开头添加几条数据
        List<String> refreshData = List.generate(5, (i) => '下拉刷新数据${i + 1}');
        _list.insertAll(0, refreshData);
      });
    });
  }

  // 上拉加载
  Future<Null> _loadMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      // 模拟数据的延迟加载
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          List<String> loadMoreData = List.generate(5, (i) => '上拉加载数据${i + 1}');
          _list.addAll(loadMoreData);
        });
      });
    }
  }
}
