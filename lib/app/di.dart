import 'package:cocktail_gen/data/api/gpt/dto/gpt_client.dart';
import 'package:riverpod/riverpod.dart';

import 'keys.dart';

final gptClientProvider = Provider<GptClient>(
  (ref) => GptClient(token: Keys.gptKey),
);
