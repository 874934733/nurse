import 'package:flutter/material.dart';
import 'package:nurse/patientinfo/PatientInfo.dart';

import '../utils/hextocolor.dart';

class NursePage extends StatefulWidget {
  const NursePage({super.key});

  @override
  State<NursePage> createState() => _NursePageState();
}

class _NursePageState extends State<NursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "护理",
            style: TextStyle(color: Colors.black, fontSize: 19, height: 75),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        child: const NurseList(),
      ),
    );
  }
}

class NurseList extends StatefulWidget {
  const NurseList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NurseListState();
  }
}

class _NurseListState extends State<NurseList> {
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
            width: double.infinity,
            color: HexToColor("#F7F8FC"),
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index < _list.length) {
                  return ListTile(
                      title: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PatientInfo();
                      }));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 15, right: 0, top: 13, bottom: 0),
                                child: Text(
                                  "李白",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: HexToColor("#FF333333"),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 15, top: 14, bottom: 0),
                                child: Text(
                                  "负责人：王护士",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: HexToColor("#FF666666")),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, top: 13, right: 10),
                            child: Divider(
                              color: HexToColor("#F6F6F6"),
                              height: 1,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 8, left: 5, right: 10, bottom: 10),
                                  child: Image.asset(
                                    "assets/icon_user.png",
                                    width: 41,
                                    height: 41,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "张三",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: HexToColor("#333333"),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        "315房12号床",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: HexToColor("#333333")),
                                      ),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "轻度高血糖",
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: HexToColor("#333333"),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                        height: 30,
                                        width: 65,
                                        child: TextButton(
                                          onPressed: () {},
                                          autofocus: true,
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) {
                                              //设置按下时的背景颜色
                                              if (states.contains(
                                                  MaterialState.pressed)) {
                                                return HexToColor("#eeeeee");
                                              }
                                              //默认不使用背景颜色
                                              return null;
                                            }),
                                            side: MaterialStateProperty.all(
                                                BorderSide(
                                                    color:
                                                        HexToColor("#479CFF"),
                                                    width: 1)),
                                          ),
                                          child: Text("详情",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color:
                                                      HexToColor("#479CFF"))),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
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
