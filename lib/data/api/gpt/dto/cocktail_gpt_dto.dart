class CocktailGptDto {
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> things;
  final List<String> steps;

  CocktailGptDto({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.things,
    required this.steps,
  });

  factory CocktailGptDto.fromString(String data) {
    List<String> parseArray(String line) {
      final RegExp arrayRegExp = RegExp(r'"[^"]*"');
      return arrayRegExp
          .allMatches(line)
          .map((e) => e.group(0)!.cutOne())
          .toList();
    }

    // prepare data
    data = data.replaceAll("\n", "").replaceAll(RegExp(r'[a-z]*:'), "\n");
    List<String> dataLines = data.split("\n").sublist(1);
    // parse name
    String name = dataLines[0].trim();
    // parse description
    String description = dataLines[1].trim();
    // parse ingredients
    final List<String> ingredients = parseArray(dataLines[2]);
    // parse things
    final List<String> things = parseArray(dataLines[3]);
    // parse steps
    final List<String> steps = parseArray(dataLines[4]);
    // return dto
    return CocktailGptDto(
      name: name.cutOne(),
      description: description.cutOne(),
      ingredients: ingredients,
      things: things,
      steps: steps,
    );
  }
}

extension _StringHelpers on String {
  String cutOne() => substring(1, length - 1);
}
