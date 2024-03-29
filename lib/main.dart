import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nurse/mine/mine.dart';
import 'package:nurse/nurse/nurse.dart';
import 'package:nurse/work/workpage.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isAndroid) {
    //沉浸式状态栏
    //写在组件渲染之后，是为了在渲染后进行设置赋值，覆盖状态栏，写在渲染之前对MaterialApp组件会覆盖这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Flutter',
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        height: 60,
        backgroundColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Image(
                height: 20,
                width: 20,
                color: Colors.transparent,
                image: AssetImage('assets/ic_tab1_selected.png')),
            icon: Image(
                height: 20,
                width: 20,
                image: AssetImage('assets/ic_tab1_normal.png')),
            label: "工作",
          ),
          NavigationDestination(
            selectedIcon: Image(
                height: 20,
                width: 20,
                color: Colors.transparent,
                image: AssetImage('assets/ic_tab2_selected.png')),
            icon: Image(
                height: 20,
                width: 20,
                image: AssetImage('assets/ic_tab2_normal.png')),
            label: "护理",
          ),
          NavigationDestination(
            selectedIcon: Image(
                height: 20,
                width: 20,
                color: Colors.transparent,
                image: AssetImage('assets/ic_tab3_selected.png')),
            icon: Image(
                height: 20,
                width: 20,
                image: AssetImage('assets/ic_tab3_normal.png')),
            label: "我的",
          ),
        ],
      ),
      body: <Widget>[
        const WorkPage(),
        const NursePage(),
        const MinePage(),
      ][currentPageIndex],
    );
  }
}
