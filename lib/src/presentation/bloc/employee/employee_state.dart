part of 'employee_cubit.dart';

@freezed
abstract class EmployeeState with _$EmployeeState {
  const factory EmployeeState({
    @JsonKey(includeFromJson: false, includeToJson: false)
    required BaseCubitStatus status,
    List<EmployeeModel>? employees,
    EmployeeModel? employee,
    ErrorModel? errors,
  }) = _EmployeeState;
}
