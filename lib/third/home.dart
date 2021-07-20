/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-20 16:28:58
 * @LastEditTime: 2021-07-20 18:06:12
 * @FilePath: /flutter_animation/lib/third/home.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:flutter_animation/third/card1.dart';
import 'package:flutter_animation/third/card2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    Container(color: Colors.blue)
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text('Fooderlich',
                style: Theme.of(context).textTheme.headline6)),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Card'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Card'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: 'Card'),
          ],
        ),
        body: pages[_selectedIndex]);
  }
}
