import 'package:cocktail_gen/domain/entities/ingredient.dart';

class MockIngredient {
  static final Ingredient _ingredient = Ingredient(
    id: 1,
    name: "Самбука",
    description: "Длинное описание",
    imageUrl:
        "https://irecommend.ru/sites/default/files/product-images/290233/O1DWqpsEiz63ZIJY2GFd1A.jpg",
  );

  @Deprecated("Тестовые данные")
  static List<Ingredient> data = [
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
    _ingredient,
  ];
}
