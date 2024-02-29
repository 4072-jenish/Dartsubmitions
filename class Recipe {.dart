class Recipe {
  List<String> _ingredients = [];
  List<String> _instructions = [];

  List<String> get ingredients => _ingredients;
  List<String> get instructions => _instructions;

  void addIngredient(String ingredient) {
    _ingredients.add(ingredient);
  }

  void addInstructions(List<String> instructions) {
    _instructions.addAll(instructions);
  }

  void cook() {
    print('Cooking ${_ingredients.join(', ')}:');
    for (int i = 0; i < _instructions.length; i++) {
      print('${i + 1}. ${_instructions[i]}');
    }
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recipe App'),
        ),
        body: RecipeWidget(),
      ),
    );
  }
}

class RecipeWidget extends StatefulWidget {
  @override
  _RecipeWidgetState createState() => _RecipeWidgetState();
}

class _RecipeWidgetState extends State<RecipeWidget> {
  final Recipe _recipe = Recipe();

  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _instructionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _ingredientController,
          decoration: InputDecoration(hintText: 'Add ingredient'),
        ),
        RaisedButton(
          onPressed: () {
            if (_ingredientController.text.isNotEmpty) {
              _recipe.addIngredient(_ingredientController.text);
              _ingredientController.clear();
            }
          },
          child: Text('Add Ingredient'),
        ),
        TextField(
          controller: _instructionController,
          decoration: InputDecoration(hintText: 'Add instruction'),
          maxLines: null,
        ),
        RaisedButton(
          onPressed: () {
            if (_instructionController.text.isNotEmpty) {
              _recipe.addInstructions([_instructionController.text]);
              _instructionController.clear();
            }
          },
          child: Text('Add Instruction'),
        ),
        RaisedButton(
          onPressed: () {
            _recipe.cook();
          },
          child: Text('Cook'),
        ),
      ],
    );
  }
}