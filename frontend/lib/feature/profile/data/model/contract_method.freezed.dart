// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContractMethod _$ContractMethodFromJson(Map<String, dynamic> json) {
  return _ContractMethod.fromJson(json);
}

/// @nodoc
mixin _$ContractMethod {
  String? get email => throw _privateConstructorUsedError;
  String? get linkedIn => throw _privateConstructorUsedError;
  String? get github => throw _privateConstructorUsedError;

  /// Serializes this ContractMethod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContractMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContractMethodCopyWith<ContractMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractMethodCopyWith<$Res> {
  factory $ContractMethodCopyWith(
          ContractMethod value, $Res Function(ContractMethod) then) =
      _$ContractMethodCopyWithImpl<$Res, ContractMethod>;
  @useResult
  $Res call({String? email, String? linkedIn, String? github});
}

/// @nodoc
class _$ContractMethodCopyWithImpl<$Res, $Val extends ContractMethod>
    implements $ContractMethodCopyWith<$Res> {
  _$ContractMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContractMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? linkedIn = freezed,
    Object? github = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedIn: freezed == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractMethodImplCopyWith<$Res>
    implements $ContractMethodCopyWith<$Res> {
  factory _$$ContractMethodImplCopyWith(_$ContractMethodImpl value,
          $Res Function(_$ContractMethodImpl) then) =
      __$$ContractMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? linkedIn, String? github});
}

/// @nodoc
class __$$ContractMethodImplCopyWithImpl<$Res>
    extends _$ContractMethodCopyWithImpl<$Res, _$ContractMethodImpl>
    implements _$$ContractMethodImplCopyWith<$Res> {
  __$$ContractMethodImplCopyWithImpl(
      _$ContractMethodImpl _value, $Res Function(_$ContractMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContractMethod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? linkedIn = freezed,
    Object? github = freezed,
  }) {
    return _then(_$ContractMethodImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedIn: freezed == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractMethodImpl implements _ContractMethod {
  const _$ContractMethodImpl({this.email, this.linkedIn, this.github});

  factory _$ContractMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractMethodImplFromJson(json);

  @override
  final String? email;
  @override
  final String? linkedIn;
  @override
  final String? github;

  @override
  String toString() {
    return 'ContractMethod(email: $email, linkedIn: $linkedIn, github: $github)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractMethodImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.linkedIn, linkedIn) ||
                other.linkedIn == linkedIn) &&
            (identical(other.github, github) || other.github == github));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, linkedIn, github);

  /// Create a copy of ContractMethod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractMethodImplCopyWith<_$ContractMethodImpl> get copyWith =>
      __$$ContractMethodImplCopyWithImpl<_$ContractMethodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractMethodImplToJson(
      this,
    );
  }
}

abstract class _ContractMethod implements ContractMethod {
  const factory _ContractMethod(
      {final String? email,
      final String? linkedIn,
      final String? github}) = _$ContractMethodImpl;

  factory _ContractMethod.fromJson(Map<String, dynamic> json) =
      _$ContractMethodImpl.fromJson;

  @override
  String? get email;
  @override
  String? get linkedIn;
  @override
  String? get github;

  /// Create a copy of ContractMethod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractMethodImplCopyWith<_$ContractMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
