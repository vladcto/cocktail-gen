import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cocktail_gen/data/api/gpt/dto/cocktail_gpt_dto.dart';
import 'package:cocktail_gen/data/api/gpt/dto/cocktail_gpt_mapper.dart';
import 'package:cocktail_gen/data/api/gpt/dto/gpt_prompts.dart';
import 'package:cocktail_gen/domain/entities/cocktail.dart';

class GptClient {
  final OpenAI openAI;

  GptClient._(this.openAI);

  factory GptClient({required String token}) {
    final openAi = OpenAI.instance.build(
      token: token,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 4),
      ),
      enableLog: true,
    );
    return GptClient._(openAi);
  }

  Future<Cocktail> generateRecipe(String tags, String ingredients) async {
    final request = ChatCompleteText(
      messages: [
        Messages(
          role: Role.system,
          content: GptPrompts.generateRecipePrompt(
            ingredients,
            tags,
          ),
        ),
      ],
      maxToken: 2200,
      model: GptTurbo0301ChatModel(),
    );

    final response = await openAI.onChatCompletion(request: request);
    final data = response!.choices.first.message!.content;
    final CocktailGptDto dto = CocktailGptDto.fromString(data);
    return CocktailGptMapper.mapCocktailGptDtoToCocktail(dto);
  }
}
