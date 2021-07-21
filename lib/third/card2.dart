/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-20 18:05:39
 * @LastEditTime: 2021-07-21 09:31:07
 * @FilePath: /flutter_animation/lib/third/card2.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:flutter_animation/third/fooderlich_theme.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/mag5.png',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        children: [
          const AuthorCard(
              authorName: 'Mike Katz',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/author_katz.jpeg'))
        ],
      ),
    ));
  }
}

class CircleImage extends StatelessWidget {
  const CircleImage(
      {Key? key, required this.imageProvider, this.imageRadius = 20})
      : super(key: key);
  final double imageRadius;
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      required this.imageProvider})
      : super(key: key);
  final String authorName;
  final String title;
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(imageProvider: imageProvider, imageRadius: 28),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(title, style: FooderlichTheme.lightTextTheme.headline3),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              // 用于展示一个通知条
              const snackBar = SnackBar(content: Text('Press Favofite'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.favorite_border),
            iconSize: 30,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
