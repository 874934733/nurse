import 'package:flutter/material.dart';
import 'package:nurse/utils/hextocolor.dart';

class CreateMyInput extends StatelessWidget {
  final iconString;
  final placeholder;
  final isPassword;
  final inputController;

  const CreateMyInput(
      {super.key,
      this.iconString,
      this.placeholder,
      this.isPassword,
      this.inputController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: HexToColor("#F1F7FF"),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: HexToColor("#83B5FF"), width: 1)),
      margin: const EdgeInsets.only(left: 43, right: 43),
      padding: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: 48,
      child: Row(
        children: <Widget>[
          Image.asset(iconString, width: 15, height: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                controller: inputController,
                decoration: InputDecoration.collapsed(hintText: placeholder),
                obscureText: isPassword, //是否是以星号*显示密码
              ),
            ),
          )
        ],
      ),
    );
  }
}
