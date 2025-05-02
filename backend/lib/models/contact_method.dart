import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_method.freezed.dart';

part 'contact_method.g.dart';

@freezed
class ContactMethod with _$ContactMethod {
  const factory ContactMethod({
    required String email,
    required String linkedIn,
    required String github,
    String? profileImageUrl,
    String? annotation,
  }) = _ContactMethod;

  factory ContactMethod.fromJson(Map<String, dynamic> json) =>
      _$ContactMethodFromJson(json);
}
