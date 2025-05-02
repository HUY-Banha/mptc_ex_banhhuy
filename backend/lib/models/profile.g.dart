// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      skills: (json['skills'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      bio: json['bio'] as String,
      photoUrl: json['photoUrl'] as String?,
      contact: json['contact'] == null
          ? null
          : ContactMethod.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'skills': instance.skills,
      'bio': instance.bio,
      'photoUrl': instance.photoUrl,
      'contact': instance.contact,
    };
