// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    _EmployeeModel(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      profession:
          json['profession'] == null
              ? null
              : ProfessionModel.fromJson(
                json['profession'] as Map<String, dynamic>,
              ),
      joiningDate:
          json['joining_date'] == null
              ? null
              : DateTime.parse(json['joining_date'] as String),
      finalDate:
          json['final_date'] == null
              ? null
              : DateTime.parse(json['final_date'] as String),
    );

Map<String, dynamic> _$EmployeeModelToJson(_EmployeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'email': instance.email,
      'phone': instance.phone,
      'profession': instance.profession,
      'joining_date': instance.joiningDate?.toIso8601String(),
      'final_date': instance.finalDate?.toIso8601String(),
    };
