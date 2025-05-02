// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactMethod _$ContactMethodFromJson(Map<String, dynamic> json) {
  return _ContactMethod.fromJson(json);
}

/// @nodoc
mixin _$ContactMethod {
  String get email => throw _privateConstructorUsedError;
  String get linkedIn => throw _privateConstructorUsedError;
  String get github => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get annotation => throw _privateConstructorUsedError;

  /// Serializes this ContactMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactMethodCopyWith<ContactMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactMethodCopyWith<$Res> {
  factory $ContactMethodCopyWith(
          ContactMethod value, $Res Function(ContactMethod) then) =
      _$ContactMethodCopyWithImpl<$Res, ContactMethod>;
  @useResult
  $Res call(
      {String email,
      String linkedIn,
      String github,
      String? profileImageUrl,
      String? annotation});
}

/// @nodoc
class _$ContactMethodCopyWithImpl<$Res, $Val extends ContactMethod>
    implements $ContactMethodCopyWith<$Res> {
  _$ContactMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? linkedIn = null,
    Object? github = null,
    Object? profileImageUrl = freezed,
    Object? annotation = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      linkedIn: null == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String,
      github: null == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: freezed == annotation
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactMethodImplCopyWith<$Res>
    implements $ContactMethodCopyWith<$Res> {
  factory _$$ContactMethodImplCopyWith(
          _$ContactMethodImpl value, $Res Function(_$ContactMethodImpl) then) =
      __$$ContactMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String linkedIn,
      String github,
      String? profileImageUrl,
      String? annotation});
}

/// @nodoc
class __$$ContactMethodImplCopyWithImpl<$Res>
    extends _$ContactMethodCopyWithImpl<$Res, _$ContactMethodImpl>
    implements _$$ContactMethodImplCopyWith<$Res> {
  __$$ContactMethodImplCopyWithImpl(
      _$ContactMethodImpl _value, $Res Function(_$ContactMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? linkedIn = null,
    Object? github = null,
    Object? profileImageUrl = freezed,
    Object? annotation = freezed,
  }) {
    return _then(_$ContactMethodImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      linkedIn: null == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String,
      github: null == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      annotation: freezed == annotation
          ? _value.annotation
          : annotation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactMethodImpl implements _ContactMethod {
  const _$ContactMethodImpl(
      {required this.email,
      required this.linkedIn,
      required this.github,
      this.profileImageUrl,
      this.annotation});

  factory _$ContactMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactMethodImplFromJson(json);

  @override
  final String email;
  @override
  final String linkedIn;
  @override
  final String github;
  @override
  final String? profileImageUrl;
  @override
  final String? annotation;

  @override
  String toString() {
    return 'ContactMethod(email: $email, linkedIn: $linkedIn, github: $github, profileImageUrl: $profileImageUrl, annotation: $annotation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactMethodImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.linkedIn, linkedIn) ||
                other.linkedIn == linkedIn) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.annotation, annotation) ||
                other.annotation == annotation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, linkedIn, github, profileImageUrl, annotation);

  /// Create a copy of ContactMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactMethodImplCopyWith<_$ContactMethodImpl> get copyWith =>
      __$$ContactMethodImplCopyWithImpl<_$ContactMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactMethodImplToJson(
      this,
    );
  }
}

abstract class _ContactMethod implements ContactMethod {
  const factory _ContactMethod(
      {required final String email,
      required final String linkedIn,
      required final String github,
      final String? profileImageUrl,
      final String? annotation}) = _$ContactMethodImpl;

  factory _ContactMethod.fromJson(Map<String, dynamic> json) =
      _$ContactMethodImpl.fromJson;

  @override
  String get email;
  @override
  String get linkedIn;
  @override
  String get github;
  @override
  String? get profileImageUrl;
  @override
  String? get annotation;

  /// Create a copy of ContactMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactMethodImplCopyWith<_$ContactMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
