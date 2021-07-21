/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-21 09:37:50
 * @LastEditTime: 2021-07-21 09:57:09
 * @FilePath: /flutter_animation/lib/third/card3.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:flutter_animation/third/fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/mag2.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)))),
          Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Recipe Trands',
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  const SizedBox(height: 30)
                ],
              )),
          Center(
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 12,
              children: [
                Chip(
                  label: Text('Healthy',
                      style: FooderlichTheme.lightTextTheme.bodyText1),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () {
                    print('Delete');
                  },
                ),
                Chip(
                  label: Text('Healthy',
                      style: FooderlichTheme.lightTextTheme.bodyText1),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () {
                    print('Delete');
                  },
                ),
                Chip(
                  label: Text('Healthy',
                      style: FooderlichTheme.lightTextTheme.bodyText1),
                  backgroundColor: Colors.black.withOpacity(0.7),
                  onDeleted: () {
                    print('Delete');
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
