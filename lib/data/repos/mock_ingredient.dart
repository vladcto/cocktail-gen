import 'package:cocktail_gen/domain/entities/ingredient.dart';

class MockIngredient {
  static final Ingredient ingredient = Ingredient(
    id: 1,
    name: "Самбука",
    description: """Итальянский и испанский традиционный напиток — ликёр с ароматом аниса. 

Обычно это прозрачная сладкая вязкая жидкость со специфическим ароматом и содержанием спирта 38—42 %.

В то же время имеются тёмные и даже красные разновидности самбуки.""",
    imageUrl:
        "https://irecommend.ru/sites/default/files/product-images/290233/O1DWqpsEiz63ZIJY2GFd1A.jpg",
  );

  @Deprecated("Тестовые данные")
  static List<Ingredient> data = [
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
    ingredient,
  ];
}
