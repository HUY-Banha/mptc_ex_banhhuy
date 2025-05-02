import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/domain/entity/profile.dart';

import 'contract_method.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

/// This class is used to represent a profile in the application.
/// It contains information about the user's profile such as
/// name, role, image URL, skills, and bio.
/// It is a data model that can be serialized to and from JSON.
/// It uses the Freezed package to generate immutable data classes

@freezed
class Profile with _$Profile implements ProfileEntity {
  const factory Profile({
    String? id,
    String? name,
    String? role,
    String? photoUrl,
    List<Category>? skills,
    String? bio,
    @JsonKey(name: 'contact') ContractMethod? contractMethod,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}