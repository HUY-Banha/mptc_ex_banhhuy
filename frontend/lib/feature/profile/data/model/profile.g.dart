// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      photoUrl: json['photoUrl'] as String?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      bio: json['bio'] as String?,
      contractMethod: json['contact'] == null
          ? null
          : ContractMethod.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'photoUrl': instance.photoUrl,
      'skills': instance.skills,
      'bio': instance.bio,
      'contact': instance.contractMethod,
    };
