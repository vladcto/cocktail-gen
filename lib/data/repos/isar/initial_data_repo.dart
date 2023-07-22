import 'dart:core';

import 'package:cocktail_gen/data/repos/isar/dto/cocktail_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/ingredient_measure_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/ingredient_thing_isar.dart';
import 'package:cocktail_gen/data/repos/isar/dto/tag_isar.dart';

import 'dto/ingredient_isar.dart';

sealed class InitialDataRepo {
  static List<CocktailIsar> getCocktails() {
    return [
      CocktailIsar(
        name: "Лонг Айленд Айс Ти",
        description:
            "Лонг Айленд Айс Ти - это волшебный и освежающий напиток, который обязательно покорит ваши вкусовые рецепторы. Этот уникальный ледяной чай сочетает в себе свежесть летнего бриза и чистоту айсбергов.",
        imageUrl: "https://www.edim.tv/img/small/long-island-iced-tea.jpg",
        tagsIds: [0, 1, 2, 3],
        ingredients: [
          IngredientMeasureIsar()
            ..name = "Царская Водка"
            ..ingredientId = 0
            ..quantity = 30
            ..unit = MeasureUnitsIsar.milliliters,
          IngredientMeasureIsar()
            ..name = "Белый Ром"
            ..ingredientId = -1
            ..quantity = 30
            ..unit = MeasureUnitsIsar.milliliters,
          IngredientMeasureIsar()
            ..name = "Серебряная текила"
            ..ingredientId = -1
            ..quantity = 30
            ..unit = MeasureUnitsIsar.milliliters,
          IngredientMeasureIsar()
            ..name = "Джин"
            ..ingredientId = -1
            ..quantity = 30
            ..unit = MeasureUnitsIsar.milliliters,
          IngredientMeasureIsar()
            ..name = "Трипл сек Fruko Schulz"
            ..ingredientId = -1
            ..quantity = 30
            ..unit = MeasureUnitsIsar.milliliters,
          IngredientMeasureIsar()
            ..name = "Сахарный сироп"
            ..ingredientId = -1
            ..quantity = 30
            ..unit = MeasureUnitsIsar.milliliters,
          IngredientMeasureIsar()
            ..name = "Кола"
            ..ingredientId = -1
            ..quantity = 100
            ..unit = MeasureUnitsIsar.milliliters,
          IngredientMeasureIsar()
            ..name = "Долька лимона"
            ..ingredientId = -1
            ..quantity = 1
            ..unit = MeasureUnitsIsar.pieces,
        ],
        things: [
          IngredientThingIsar()
            ..ingredientId = -1
            ..name = "Хайбол",
          IngredientThingIsar()
            ..ingredientId = -1
            ..name = "Джиггер 30 мл",
          IngredientThingIsar()
            ..ingredientId = -1
            ..name = "Коктейльная ложка",
          IngredientThingIsar()
            ..ingredientId = -1
            ..name = "2 трубочки",
        ],
        steps: [
          "Наполни хайбол кубиками льда доверху",
          "Налей лимонный сок 30 мл, сахарный сироп 30 мл и ликер трипл сек 30 мл",
          "Добавь водку 30 мл, джин 30 мл, белый ром 30 мл и серебряную текилу 30 мл",
          "Долей колу доверху и аккуратно размешай коктейльной ложкой",
          "Укрась долькой лимона",
        ],
      ),
    ];
  }

  static List<IngredientIsar> getIngredients() {
    return [
      IngredientIsar(
        id: 0,
        name: "Водка",
        description:
            "Водка - это блестящий и легендарный алкогольный напиток, который уносит нас в удивительный мир роскоши и традиции. Она обладает кристальной чистотой, наполняющей каждый глоток чистотой и ясностью.\n\nИзготавливается водка из отборных зерновых культур или картофеля, которые проходят тщательную переработку и дистилляцию, чтобы получить наилучшее качество. Ее процесс создания является настоящим искусством, передающим мастерство поколений и тайные рецепты, способные удивить своим великолепием.\n\nВолшебное сочетание нот и ароматов придает водке особый характер. В каждой капле она раскрывает свою уникальную гармонию, переплетая легкие цветочные ноты с ягодными оттенками и легким ореховым послевкусием. Она приносит наслаждение и радость, притягивая своей привлекательной сладостью и приятным пикантным штрихом.",
        type: "Зерновой спиртной напиток",
        imageUrl: "https://cdn.metro-cc.ru/ru/ru_pim_29086001001_01.png",
      ),
      IngredientIsar(
        id: 1,
        name: "Ром",
        description: "Крутой",
        type: "Акссесуар",
        imageUrl:
            "https://sdelai-doma.ru/upload/medialibrary/135/135a80107ee01bdda3e9663b5631e1e8.jpg",
      ),
      IngredientIsar(
        id: 2,
        name: "Текила",
        description: "Крутой",
        type: "Акссесуар",
        imageUrl: "https://shop.miratorg.ru/upload/iblock/0c1/RN000310.jpg",
      ),
      IngredientIsar(
        id: 3,
        name: "Джин",
        description: "Крутой",
        type: "Джин",
        imageUrl:
            "https://vinoteki.ru/wp-content/uploads/2022/08/32945_f4aa18a2-ab1f-11ea-8149-002590ea1e13.jpeg",
      ),
      IngredientIsar(
        id: 4,
        name: "Сахарный сироп",
        description: "Крутой",
        type: "Акссесуар",
        imageUrl:
            "https://static.insales-cdn.com/images/products/1/3109/120212517/large_sirop-monin-saharniy-trosnik-900x900px.jpg",
      ),
      IngredientIsar(
        id: 5,
        name: "Кола",
        description: "Крутой",
        type: "Акссесуар",
        imageUrl: "https://sokovoz.ru/_sh/49/4969m.jpg",
      ),
      IngredientIsar(
        id: 6,
        name: "Лимон",
        description: "Крутой",
        type: "Акссесуар",
        imageUrl:
            "https://m.dom-eda.com/uploads/topics/preview/00/00/03/20/06fa2fc486_500.jpg",
      ),
    ];
  }

  static List<TagIsar> getTags() {
    return [
      TagIsar("крепкие", id: 0),
      TagIsar("сладкие", id: 1),
      TagIsar("классика", id: 2),
      TagIsar("физы", id: 3),
    ];
  }
}
