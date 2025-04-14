// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  email: json['email'] as String?,
  avatar: json['avatar'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'avatar': instance.avatar,
      'created_at': instance.createdAt,
    };
