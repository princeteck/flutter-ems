// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeState {

@JsonKey(includeFromJson: false, includeToJson: false) BaseCubitStatus get status; List<EmployeeModel>? get employees; EmployeeModel? get employee; ErrorModel? get errors; int? get employeesCount;
/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeStateCopyWith<EmployeeState> get copyWith => _$EmployeeStateCopyWithImpl<EmployeeState>(this as EmployeeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.employees, employees)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.errors, errors) || other.errors == errors)&&(identical(other.employeesCount, employeesCount) || other.employeesCount == employeesCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(employees),employee,errors,employeesCount);

@override
String toString() {
  return 'EmployeeState(status: $status, employees: $employees, employee: $employee, errors: $errors, employeesCount: $employeesCount)';
}


}

/// @nodoc
abstract mixin class $EmployeeStateCopyWith<$Res>  {
  factory $EmployeeStateCopyWith(EmployeeState value, $Res Function(EmployeeState) _then) = _$EmployeeStateCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) BaseCubitStatus status, List<EmployeeModel>? employees, EmployeeModel? employee, ErrorModel? errors, int? employeesCount
});


$EmployeeModelCopyWith<$Res>? get employee;$ErrorModelCopyWith<$Res>? get errors;

}
/// @nodoc
class _$EmployeeStateCopyWithImpl<$Res>
    implements $EmployeeStateCopyWith<$Res> {
  _$EmployeeStateCopyWithImpl(this._self, this._then);

  final EmployeeState _self;
  final $Res Function(EmployeeState) _then;

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? employees = freezed,Object? employee = freezed,Object? errors = freezed,Object? employeesCount = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseCubitStatus,employees: freezed == employees ? _self.employees : employees // ignore: cast_nullable_to_non_nullable
as List<EmployeeModel>?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeModel?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as ErrorModel?,employeesCount: freezed == employeesCount ? _self.employeesCount : employeesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeModelCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeModelCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorModelCopyWith<$Res>? get errors {
    if (_self.errors == null) {
    return null;
  }

  return $ErrorModelCopyWith<$Res>(_self.errors!, (value) {
    return _then(_self.copyWith(errors: value));
  });
}
}


/// @nodoc


class _EmployeeState implements EmployeeState {
  const _EmployeeState({@JsonKey(includeFromJson: false, includeToJson: false) required this.status, final  List<EmployeeModel>? employees, this.employee, this.errors, this.employeesCount = 0}): _employees = employees;
  

@override@JsonKey(includeFromJson: false, includeToJson: false) final  BaseCubitStatus status;
 final  List<EmployeeModel>? _employees;
@override List<EmployeeModel>? get employees {
  final value = _employees;
  if (value == null) return null;
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  EmployeeModel? employee;
@override final  ErrorModel? errors;
@override@JsonKey() final  int? employeesCount;

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeStateCopyWith<_EmployeeState> get copyWith => __$EmployeeStateCopyWithImpl<_EmployeeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._employees, _employees)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.errors, errors) || other.errors == errors)&&(identical(other.employeesCount, employeesCount) || other.employeesCount == employeesCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_employees),employee,errors,employeesCount);

@override
String toString() {
  return 'EmployeeState(status: $status, employees: $employees, employee: $employee, errors: $errors, employeesCount: $employeesCount)';
}


}

/// @nodoc
abstract mixin class _$EmployeeStateCopyWith<$Res> implements $EmployeeStateCopyWith<$Res> {
  factory _$EmployeeStateCopyWith(_EmployeeState value, $Res Function(_EmployeeState) _then) = __$EmployeeStateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) BaseCubitStatus status, List<EmployeeModel>? employees, EmployeeModel? employee, ErrorModel? errors, int? employeesCount
});


@override $EmployeeModelCopyWith<$Res>? get employee;@override $ErrorModelCopyWith<$Res>? get errors;

}
/// @nodoc
class __$EmployeeStateCopyWithImpl<$Res>
    implements _$EmployeeStateCopyWith<$Res> {
  __$EmployeeStateCopyWithImpl(this._self, this._then);

  final _EmployeeState _self;
  final $Res Function(_EmployeeState) _then;

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? employees = freezed,Object? employee = freezed,Object? errors = freezed,Object? employeesCount = freezed,}) {
  return _then(_EmployeeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseCubitStatus,employees: freezed == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<EmployeeModel>?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeModel?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as ErrorModel?,employeesCount: freezed == employeesCount ? _self.employeesCount : employeesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeModelCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeModelCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of EmployeeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ErrorModelCopyWith<$Res>? get errors {
    if (_self.errors == null) {
    return null;
  }

  return $ErrorModelCopyWith<$Res>(_self.errors!, (value) {
    return _then(_self.copyWith(errors: value));
  });
}
}

// dart format on
