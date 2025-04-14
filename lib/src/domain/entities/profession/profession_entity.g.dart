// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfessionEntity _$ProfessionEntityFromJson(Map<String, dynamic> json) =>
    _ProfessionEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ProfessionEntityToJson(_ProfessionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
