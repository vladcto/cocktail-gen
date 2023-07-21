import 'package:isar/isar.dart';

part 'tag_isar.g.dart';

@collection
class TagIsar {
  final Id id;
  final String name;

  TagIsar(
    this.name, {
    this.id = Isar.autoIncrement,
  });
}
