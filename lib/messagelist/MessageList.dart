import 'package:flutter/material.dart';

import '../utils/HexToColor.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => {},
        ),
        title: const Text(
          '系统消息',
          style: TextStyle(color: Colors.black, fontSize: 19, height: 75),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: HexToColor("#F7F8FC"), // 设置容器的颜色
        ),
        width: double.infinity,
        height: double.infinity,
        child: const MessageList(),
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> {
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (index < _list.length) {
                return ListTile(
                  title: Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 12, left: 15),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icon_message_tips.png",
                                    width: 18,
                                    height: 16,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "系统消息",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: HexToColor("#333333")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16, right: 15),
                              child: Text("2023-05-05 13:32",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: HexToColor("#666666"))),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 12, right: 10, left: 10),
                          child: Divider(
                            color: HexToColor("#F6F6F6"),
                            height: 1,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                                top: 15, left: 15, right: 15, bottom: 25),
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
