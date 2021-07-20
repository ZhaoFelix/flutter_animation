/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-20 15:29:36
 * @LastEditTime: 2021-07-20 16:39:39
 * @FilePath: /flutter_animation/lib/third/main.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:flutter_animation/third/home.dart';
import 'fooderlich_theme.dart';

// Flutter uses the const keyword as an idicator for a widget to never rebuild as it will get evaluated at compile time and only once.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
        theme: theme,
        title: 'Fooderlich',
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
