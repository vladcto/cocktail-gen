import 'package:isar/isar.dart';

part 'ingredient_measure_isar.g.dart';

enum MeasureUnitsIsar {
  none,
  spoons,
  pieces,
  milliliters,
  oz,
  leaves,
  drops,
}

@embedded
class IngredientMeasureIsar {
  late String name;
  late double quantity;
  @enumerated
  late MeasureUnitsIsar unit;
  late int ingredientId;
}
