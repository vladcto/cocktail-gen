import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

@freezed
abstract class Tag with _$Tag {
  factory Tag({
    /// ID тега в базе данных.
    ///
    /// -1 если такого тега не существует.
    @Default(-1) int id,
    required String name,
  }) = _Tag;
}
