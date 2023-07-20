extension UrlCutterExtension on String {
  /// Обрезает URL до последнего "/".
  String get prevUrl => substring(0, lastIndexOf("/"));
}
