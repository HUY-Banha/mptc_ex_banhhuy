// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactMethodImpl _$$ContactMethodImplFromJson(Map<String, dynamic> json) =>
    _$ContactMethodImpl(
      email: json['email'] as String,
      linkedIn: json['linkedIn'] as String,
      github: json['github'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      annotation: json['annotation'] as String?,
    );

Map<String, dynamic> _$$ContactMethodImplToJson(_$ContactMethodImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'linkedIn': instance.linkedIn,
      'github': instance.github,
      'profileImageUrl': instance.profileImageUrl,
      'annotation': instance.annotation,
    };
