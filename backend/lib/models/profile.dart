import 'package:backend/models/category.dart';
import 'package:backend/models/contact_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String name,
    required String role,
    required List<Category> skills,
    required String bio,
    String? photoUrl,
    ContactMethod? contact,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
