// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profession_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfessionModel _$ProfessionModelFromJson(Map<String, dynamic> json) =>
    _ProfessionModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ProfessionModelToJson(_ProfessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
