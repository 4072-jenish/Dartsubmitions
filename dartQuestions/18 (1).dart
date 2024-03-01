class RecipeBook {
  Map<String, Map<String, String>> recipes = {
    'recipe1': {'name': 'Spaghetti Bolognese', 'ingredients': 'pasta, ground beef, tomato sauce, onion, garlic'},
    'recipe2': {'name': 'Chicken Curry', 'ingredients': 'chicken, coconut milk, curry powder, onion, garlic'},
  };
  Map<String, String> ingredients = {
    'pasta': 'spaghetti, fettuccine, linguine',
    'ground beef': 'beef, pork, turkey',
    'tomato sauce': 'tomato, tomato paste, water',
    'onion': 'yellow onion, white onion, red onion',
    'garlic': 'garlic, garlic powder',
    'chicken': 'chicken breast, chicken thigh, chicken drumstick',
    'coconut milk': 'coconut milk, coconut cream',
    'curry powder': 'curry powder, turmeric, cumin',
  };
  RecipeBook({required this.recipes, required this.ingredients});
  void addRecipe(String recipeId, String recipeName, String ingredientsText) {
    if (!recipes.containsKey(recipeId)) {
      recipes[recipeId] = {'name': recipeName, 'ingredients': ingredientsText};
      String[] ingredientList = ingredientsText.split(',');
      for (String ingredient in ingredientList) {
        String cleanedIngredient = ingredient.trim();
        if (!ingredients.containsKey(cleanedIngredient)) {
          ingredients[cleanedIngredient] = cleanedIngredient;
        }
      }
      print('Recipe added with ID: $recipeId');
    } else {
      print('Recipe with ID: $recipeId already exists');
    }
  }
  void searchRecipe(String ingredient) {
    if (ingredients.containsKey(ingredient)) {
      List<String> matchingRecipes = [];
      for (String recipeId in recipes.keys) {
        if (recipes[recipeId]['ingredients'].contains(ingredient)) {
          matchingRecipes.add(recipeId);
        }
      }
      if (matchingRecipes.isNotEmpty) {
        print('Matching recipes for $ingredient: $matchingRecipes');
      } else {
        print('No recipes found for $ingredient');
      }
    } else {
      print('Invalid ingredient: $ingredient');
    }
  }
}
void main() {
  final recipeBook = RecipeBook(recipes: {'recipe1': {'name': 'Spaghetti Bolognese', 'ingredients': 'pasta, ground beef, tomato sauce, onion, garlic'}, 'recipe2': {'name': 'Chicken Curry', 'ingredients': 'chicken, coconut milk, curry powder, onion, garlic'}}, ingredients: {'pasta': 'spaghetti, fettuccine, linguine', 'ground beef': 'beef, pork, turkey', 'tomato sauce': 'tomato, tomato paste, water', 'onion': 'yellow onion, white onion, red onion', 'garlic': 'garlic, garlic powder', 'chicken': 'chicken breast, chicken thigh, chicken drumstick', 'coconut milk': 'coconut milk, coconut cream', 'curry powder': 'curry powder, turmeric, cumin'});
  recipeBook.addRecipe('recipe3', 'Vegetable Stir Fry', 'broccoli, carrot, bell pepper, onion, garlic');
  recipeBook.searchRecipe('onion');
}