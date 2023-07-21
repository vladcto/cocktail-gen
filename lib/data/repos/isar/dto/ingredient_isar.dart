import 'package:isar/isar.dart';

part 'ingredient_isar.g.dart';

@collection
class IngredientIsar {
  final Id id;
  final String name;
  final String description;
  final String type;
  final String imageUrl;

  IngredientIsar({
    this.id = Isar.autoIncrement,
    required this.name,
    required this.description,
    required this.type,
    required this.imageUrl,
  });
}
