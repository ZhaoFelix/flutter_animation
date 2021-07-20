/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-20 16:54:15
 * @LastEditTime: 2021-07-20 17:04:49
 * @FilePath: /flutter_animation/lib/third/card1.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mag2.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    ));
  }
}
