import 'package:cocktail_gen/domain/entities/cocktail.dart';
import 'package:cocktail_gen/domain/entities/ingredient_measure.dart';
import 'package:cocktail_gen/domain/entities/ingredient_thing.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';

class MockCocktail {
  static final Cocktail cocktail = Cocktail(
    id: 1,
    name: "Мохито",
    description: "Refreshing cocktail with mint and lime flavors.",
    imageUrl:
        "https://upload.wikimedia.org/wikipedia/commons/b/b3/Mojito_made_with_rum%2C_lime%2C_sugar%2C_mint%2C_club_soda%2C_served_in_a_tall_glass_-_Evan_Swigart.jpg",
    tags: [
      Tag(id: 1, name: "Refreshing"),
      Tag(id: 2, name: "Minty"),
    ],
    ingredients: [
      IngredientMeasure(
        ingredientId: 1,
        name: "White Rum",
        quantity: 60.0,
        unit: MeasureUnits.milliliters,
      ),
      IngredientMeasure(
        ingredientId: 2,
        name: "Fresh Lime Juice",
        quantity: 30.0,
        unit: MeasureUnits.milliliters,
      ),
      IngredientMeasure(
        ingredientId: 3,
        name: "Simple Syrup",
        quantity: 20.0,
        unit: MeasureUnits.milliliters,
      ),
      IngredientMeasure(
        ingredientId: 4,
        name: "Fresh Mint Leaves",
        quantity: 6.0,
        unit: MeasureUnits.pieces,
      ),
      IngredientMeasure(
        ingredientId: 5,
        name: "Soda Water",
        quantity: 120.0,
        unit: MeasureUnits.milliliters,
      ),
    ],
    things: [
      IngredientThing(ingredientId: 1, name: "Джиггер 30 мл"),
      IngredientThing(ingredientId: 2, name: "Бостонский шейкер"),
    ],
    steps: [
      "In a glass, muddle mint leaves and simple syrup.SOOOOOOOOOOOOOOOOOOOOOOOOOOOOOMEEEEEEEEEEEEEEEEEEEE LOOOOOOOOOOOOOONG TEEEXT",
      "Add fresh lime juice and white rum.",
      "Fill the glass with crushed ice.",
      "Top up with soda water.",
      "Garnish with mint sprigs and lime slices.",
    ],
  );

  @Deprecated("Тестовые данные")
  static List<Cocktail> data = [
    cocktail,
    cocktail,
    cocktail,
    cocktail,
    cocktail,
    cocktail,
    cocktail,
    cocktail,
    cocktail,
    cocktail,
    cocktail,
  ];
}
