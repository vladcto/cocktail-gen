import 'package:isar/isar.dart';

part 'tag_isar.g.dart';

@collection
class TagIsar {
  final Id id = Isar.autoIncrement;
  final String name;

  TagIsar(this.name);
}
