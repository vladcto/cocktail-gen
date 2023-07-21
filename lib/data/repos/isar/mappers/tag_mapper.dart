// tag_isar.dart
import 'package:cocktail_gen/data/repos/isar/dto/tag_isar.dart';
import 'package:cocktail_gen/domain/entities/tag.dart';

extension TagIsarMapper on TagIsar {
  Tag toTag() {
    return Tag(
      id: id,
      name: name,
    );
  }
}
