// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => _ErrorModel(
  status: json['status'] as String?,
  code: json['code'] as String?,
  message: json['message'] as String?,
  fullName: json['full_name'] as String?,
  email: json['email'] as String?,
  joiningDate: json['joining_date'] as String?,
  finalDate: json['final_date'] as String?,
  professionName: json['profession_name'] as String?,
);

Map<String, dynamic> _$ErrorModelToJson(_ErrorModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'full_name': instance.fullName,
      'email': instance.email,
      'joining_date': instance.joiningDate,
      'final_date': instance.finalDate,
      'profession_name': instance.professionName,
    };
