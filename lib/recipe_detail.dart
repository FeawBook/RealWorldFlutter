import 'package:flutter/material.dart';
import 'Recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
          child: Column(children: <Widget>[
        SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(widget.recipe.imageUrl)),
        const SizedBox(height: 4),
        Text(widget.recipe.label),
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  return Text(
                      '${ingredient.quantity * _sliderValue} ${ingredient.measure} ${ingredient.name}');
                })),
        Slider(
          min: 1,
          max: 10,
          divisions: 9,
          label: '${_sliderValue * widget.recipe.servings} serving',
          value: _sliderValue.toDouble(),
          onChanged: (newValue) {
            setState(() {
              _sliderValue = newValue.round();
            });
          },
          activeColor: Colors.green,
          inactiveColor: Colors.black,
        )
      ])),
    );
  }
}
