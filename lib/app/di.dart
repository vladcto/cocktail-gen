import 'package:cocktail_gen/data/api/gpt/dto/gpt_client.dart';
import 'package:cocktail_gen/data/repos/isar/controllers/isar_db.dart';
import 'package:cocktail_gen/interfaces/db_repository.dart';
import 'package:get_it/get_it.dart';

import 'keys.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<GptClient>(GptClient(token: Keys.gptKey));
  getIt.registerSingleton<RecipeRepository>(CocktailIsarDb());
}
