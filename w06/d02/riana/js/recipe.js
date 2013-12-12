/*
Create an object to hold information on your favorite recipe.
It should have properties for title (a string), servings (a number), and ingredients (an array of strings).
On separate lines (one console.log statement for each), log the recipe information so it looks like:
Mole
Serves: 2
Ingredients:
cinnamon
cumin
cocoa
*/

var recipe = function(title, servings, ingredients) {
  return{
    title: title,
    servings: servings,
    ingredients: ingredients
  }
}

var bananabread = recipe("Banana Bread", 10, ["bananas","flour","olive oil","salt","sugar","egg"]);
