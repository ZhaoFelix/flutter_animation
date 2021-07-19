/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-19 17:45:01
 * @LastEditTime: 2021-07-19 20:16:48
 * @FilePath: /flutter_animation/lib/01_text/main.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '张风捷特烈',
              style: TextStyle(fontSize: 60, foreground: getPaint()),
            ),
            AnimatText(),
            SkewShadowText(),
            TextTyper()
          ],
        ),
      ),
    );
  }
}

// 通过动画的方式生成效果
class AnimatText extends StatefulWidget {
  const AnimatText({Key? key}) : super(key: key);

  @override
  _AnimatTextState createState() => _AnimatTextState();
}

class _AnimatTextState extends State<AnimatText>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final Duration animationDuration = const Duration(milliseconds: 1000); // 动画时长
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnim,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: _buildByAnim,
      ),
    );
  }

  void _startAnim() {
    // 开始动画
    _ctrl.forward(from: 0);
  }

  Widget _buildByAnim(BuildContext context, Widget? child) {
    return Text(
      '张风捷特烈',
      style: TextStyle(
          fontSize: 60,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..shader = ui.Gradient.linear(const Offset(0, 0), Offset(100, 0),
                colors, pos, TileMode.mirror, Matrix4.rotationZ(pi / 6).storage)
            // 添加文字外框的模糊效果
            ..maskFilter = MaskFilter.blur(BlurStyle.solid, 15 * _ctrl.value)),
    );
  }
}

//文字渐变阴影
class SkewShadowText extends StatelessWidget {
  final TextStyle commonStyle = TextStyle(fontSize: 60, color: Colors.blue);
  final TextStyle shadowStyle =
      TextStyle(fontSize: 60, color: Colors.blue.withAlpha(88));
  final String text = '张风捷特烈';
  @override
  Widget build(BuildContext context) {
    // 设置X轴的偏移
    Matrix4 matrix4 = Matrix4.skewX(4 * pi / 180);

    return Stack(children: [
      Text(text, style: commonStyle),
      Transform(
        transform: matrix4,
        child: Text(
          text,
          style: shadowStyle,
        ),
      )
    ]);
  }
}

//文字打印机
class TextTyper extends StatefulWidget {
  const TextTyper({Key? key}) : super(key: key);

  @override
  _TextTyperState createState() => _TextTyperState();
}

class _TextTyperState extends State<TextTyper> {
  final Duration animDuration = const Duration(milliseconds: 200);

  final String text = '桃树、杏树、梨树，你不让我，我不让你，都开满了花赶趟儿。'
      '红的像火，粉的像霞，白的像雪。花里带着甜味，闭了眼，'
      '树上仿佛已经满是桃儿、杏儿、梨儿。';
  final ValueNotifier<String> data = ValueNotifier<String>("");
  late Timer _timer;
  int curretIndex = 0;
  String get currentText => text.substring(0, curretIndex);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(animDuration, _type);
    _startAnim();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    data.dispose();
    super.dispose();
  }

  void _startAnim() {
    _timer.cancel();
    data.value = "";
    curretIndex = 0;
    _timer = Timer.periodic(animDuration, _type);
  }

  void _type(Timer timer) {
    if (curretIndex < text.length) {
      curretIndex++;
      data.value = currentText;
    } else {
      _timer.cancel();
      // _timer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _startAnim,
        child: SizedBox(
            width: 300,
            child: AnimatedBuilder(
              animation: data,
              builder: _buildAnim,
            )));
  }

  Widget _buildAnim(_, __) =>
      Text(data.value, style: const TextStyle(color: Colors.blue));
}

final List<Color> colors = [
  Color(0xFFF60C0C),
  Color(0xFFF3B913),
  Color(0xFFE7F716),
  Color(0xFF3DF30B),
  Color(0xFF0DF6EF),
  Color(0xFF0829FB),
  Color(0xFFB709F4),
];
final List<double> pos = [
  1.0 / 7.0,
  2.0 / 7.0,
  3.0 / 7.0,
  4.0 / 7.0,
  5.0 / 7.0,
  6.0 / 7.0,
  7.0 / 7.0,
];
Paint getPaint() {
  Paint paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;
  paint.shader = ui.Gradient.linear(const Offset(0, 0), Offset(100, 0), colors,
      pos, TileMode.mirror, Matrix4.rotationZ(pi / 6).storage);
  return paint;
}
