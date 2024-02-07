import 'package:flutter/material.dart';
import 'package:nurse/utils/hextocolor.dart';

import '../utils/createmyinput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // 在这里执行登录逻辑
    // Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/icon_login_bg.png",
              width: double.infinity,
              fit: BoxFit.fill, // 完全填充
              height: 260,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 26, bottom: 20),
                  child: Text(
                    "智慧养老管理系统",
                    style: TextStyle(
                        color: HexToColor("#4CA8FE"),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            CreateMyInput(
                iconString: "assets/icon_acount.png",
                placeholder: "请输入手机号",
                isPassword: false,
                inputController: _usernameController),
            Container(
              margin: const EdgeInsets.only(bottom: 50, top: 15),
              child: CreateMyInput(
                  iconString: "assets/icon_pwd.png",
                  placeholder: "请输入密码",
                  isPassword: true,
                  inputController: _passwordController),
            ),
            GestureDetector(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 42, right: 42),
                height: 48,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color.fromRGBO(85, 186, 254, 1),
                      Color.fromRGBO(48, 114, 255, 1),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(24)),
                child: const Center(
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      )),
    );
  }
}
