import "package:flutter/material.dart";

import "../../utils/HexToColor.dart";

class NurseRecords extends StatelessWidget {
  const NurseRecords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        width: double.infinity,
        height: double.infinity,
        child: const NursingRecordsList(),
      ),
    );
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
                      color: HexToColor("#ffffff"),
                      width: double.infinity,
                      height: 80,
                      child: Column(
                        children: [
                          Container(
                              margin:
                                  const EdgeInsets.only(top: 15, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "张三",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: HexToColor("#333333")),
                                  ),
                                  Text(
                                    "日常检查",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: HexToColor("#333333")),
                                  ),
                                ],
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "315房12号床",
                                style: TextStyle(
                                    fontSize: 14, color: HexToColor("#666666")),
                              ),
                              Text(
                                "护理时间：2023-05-05 13:30",
                                style: TextStyle(
                                    fontSize: 14, color: HexToColor("#666666")),
                              ),
                            ],
                          ),
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
