import 'package:flutter/material.dart';

import '../utils/hextocolor.dart';

class CarePlanPage extends StatefulWidget {
  const CarePlanPage({super.key});

  @override
  State<CarePlanPage> createState() => _CarePlanPageState();
}

class _CarePlanPageState extends State<CarePlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {Navigator.of(context).pop('刷新')},
        ),
        title: const Text(
          '护理计划',
          style: TextStyle(color: Colors.black, fontSize: 19, height: 75),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        child: const CarePlanList(),
      ),
    );
  }
}

class CarePlanList extends StatefulWidget {
  const CarePlanList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CarePlanListState();
  }
}

class _CarePlanListState extends State<CarePlanList> {
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
                      margin: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15, top: 10, bottom: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 5, right: 15),
                                  child: Text(
                                    "2023-05-02 12:26",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: HexToColor("#333333"),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/icon_user.png",
                                      width: 20,
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "张三",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: HexToColor("#333333")),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, bottom: 15, right: 10),
                            child: Divider(
                              color: HexToColor("#F6F6F6"),
                              height: 1,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 15, bottom: 10, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "事件：输液",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HexToColor("#333333")),
                                ),
                                Text(
                                  "未完成",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: HexToColor("#E91010")),
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 15, bottom: 10, right: 15),
                              constraints: const BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: Text(
                                "这是备注占位这是备注占位这是备注占位这是备注占位这是备注占位这是备注占位这",
                                style: TextStyle(
                                    fontSize: 12, color: HexToColor("#333333")),
                              ))
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
