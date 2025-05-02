import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/entity/category.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category implements CategoryEntity {
  const factory Category({
    int? id,
    String? name,
    String? title,
    String? body,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}