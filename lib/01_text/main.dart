/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-19 17:45:01
 * @LastEditTime: 2021-07-19 18:09:54
 * @FilePath: /flutter_animation/lib/01_text/main.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'package:flutter/material.dart';

void main() {
  runApp(StaticAimation());
}

class StaticAimation extends StatelessWidget {
  const StaticAimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('基于文字的动画'),
          centerTitle: true,
        ),
      ),
    );
  }
}
