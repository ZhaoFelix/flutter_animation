/*
 * @Author: Felix
 * @Email: felix@qingmaoedu.com
 * @Date: 2021-07-20 11:11:55
 * @LastEditTime: 2021-07-20 15:11:50
 * @FilePath: /flutter_animation/lib/recipe/recipe_detail.dart
 * Copyright © 2019 Shanghai Qingmao Network Technology Co.,Ltd All rights reserved.
 */
import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.label)),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 4),
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: AssetImage(widget.recipe.imageUrl),
                )),
            const SizedBox(height: 4),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(7.0),
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ingredient = widget.recipe.ingredients[index];
                      return Text(
                          '${ingredient.quantity * _sliderVal} ${ingredient.measure} ${ingredient.name}');
                    })),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              value: _sliderVal.toDouble(),
              label: '${_sliderVal * widget.recipe.servings} servings',
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
