import 'package:flutter/material.dart';

import '../utils/HexToColor.dart';

class ChangeShiftsPage extends StatefulWidget {
  const ChangeShiftsPage({super.key});

  @override
  State<ChangeShiftsPage> createState() => _ChangeShiftsPageState();
}

class _ChangeShiftsPageState extends State<ChangeShiftsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {Navigator.of(context).pop('刷新')},
        ),
        title: const Text(
          '交班管理',
          style: TextStyle(color: Colors.black, fontSize: 19, height: 75),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        child: const ChangeShiftsList(),
      ),
    );
  }
}

class ChangeShiftsList extends StatefulWidget {
  const ChangeShiftsList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChangeShiftsListState();
  }
}

class _ChangeShiftsListState extends State<ChangeShiftsList> {
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
                        constraints: const BoxConstraints(minHeight: 200),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/icon_night_shift.png'),
                            fit: BoxFit.fill, // 完全填充
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              margin: const EdgeInsets.only(
                                  left: 25, right: 8, top: 35, bottom: 10),
                              child: Text(
                                "白班",
                                style: TextStyle(
                                    color: HexToColor("#222222"),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              margin: const EdgeInsets.only(
                                  left: 25, right: 8, bottom: 20),
                              child: Text("2023-01-01",
                                  style: TextStyle(
                                      color: HexToColor("#333333"),
                                      fontSize: 14)),
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              margin: const EdgeInsets.only(
                                  left: 35, right: 50, bottom: 65),
                              child: Text(
                                  "占位占位占位占位占位占位",
                                  style: TextStyle(
                                      color: HexToColor("#333333"),
                                      fontSize: 14)),
                            )
                          ],
                        )),
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
