import 'package:ems/src/domain/entities/profession/profession_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee_entity.freezed.dart';
part 'employee_entity.g.dart';

@freezed
abstract class EmployeeEntity with _$EmployeeEntity {
  factory EmployeeEntity({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'profession') ProfessionEntity? profession,
    @JsonKey(name: 'joining_date') DateTime? joiningDate,
    @JsonKey(name: 'final_date') DateTime? finalDate,
  }) = _EmployeeEntity;
  factory EmployeeEntity.fromJson(Map<String, dynamic> json) =>
      _$EmployeeEntityFromJson(json);
}

extension EmployeeEntityExtension on EmployeeEntity {
  asMap() {
    final Map<String, dynamic> data = Map<String, dynamic>.from(toJson());
    return data;
  }
}
