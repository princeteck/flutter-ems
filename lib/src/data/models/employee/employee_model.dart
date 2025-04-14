import 'package:freezed_annotation/freezed_annotation.dart';

import '../profession/profession_model.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
abstract class EmployeeModel with _$EmployeeModel {
  factory EmployeeModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'profession') ProfessionModel? profession,
    @JsonKey(name: 'joining_date') DateTime? joiningDate,
    @JsonKey(name: 'final_date') DateTime? finalDate,
  }) = _EmployeeModel;
  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}

extension EmployeeModelExtension on EmployeeModel {
  bool isComplete() {
    final Map<String, dynamic> json = Map<String, dynamic>.from(toJson());
    json.removeWhere(
      (key, value) =>
          key == 'id' ||
          key == 'avatar' ||
          key == 'profession' ||
          key == 'phone' ||
          key == 'final_date',
    );
    for (final value in json.values) {
      if (value != null) {
        if (value is String && value.isEmpty) {
          return true;
        } else if (value is! String) {
          return true;
        }
      } else {
        return true;
      }
    }
    return false;
  }

  bool isCurrentEmployee() {
    return joiningDate != null && finalDate == null;
  }

  bool isFormerEmployee() {
    return joiningDate != null && finalDate != null;
  }
}
