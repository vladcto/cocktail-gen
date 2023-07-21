import 'package:isar/isar.dart';

part 'ingredient_isar.g.dart';

@collection
class IngredientIsar {
  Id id = Isar.autoIncrement;
  final String name;
  final String description;
  final String type;
  final String imageUrl;

  IngredientIsar(
    this.name,
    this.description,
    this.type,
    this.imageUrl,
  );
}
