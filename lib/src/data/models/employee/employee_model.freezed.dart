// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeModel {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'avatar') String? get avatar;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'phone') String? get phone;@JsonKey(name: 'profession') ProfessionModel? get profession;@JsonKey(name: 'joining_date') DateTime? get joiningDate;@JsonKey(name: 'final_date') DateTime? get finalDate;
/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeModelCopyWith<EmployeeModel> get copyWith => _$EmployeeModelCopyWithImpl<EmployeeModel>(this as EmployeeModel, _$identity);

  /// Serializes this EmployeeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.joiningDate, joiningDate) || other.joiningDate == joiningDate)&&(identical(other.finalDate, finalDate) || other.finalDate == finalDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatar,email,phone,profession,joiningDate,finalDate);

@override
String toString() {
  return 'EmployeeModel(id: $id, fullName: $fullName, avatar: $avatar, email: $email, phone: $phone, profession: $profession, joiningDate: $joiningDate, finalDate: $finalDate)';
}


}

/// @nodoc
abstract mixin class $EmployeeModelCopyWith<$Res>  {
  factory $EmployeeModelCopyWith(EmployeeModel value, $Res Function(EmployeeModel) _then) = _$EmployeeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'email') String? email,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'profession') ProfessionModel? profession,@JsonKey(name: 'joining_date') DateTime? joiningDate,@JsonKey(name: 'final_date') DateTime? finalDate
});


$ProfessionModelCopyWith<$Res>? get profession;

}
/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._self, this._then);

  final EmployeeModel _self;
  final $Res Function(EmployeeModel) _then;

/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,Object? avatar = freezed,Object? email = freezed,Object? phone = freezed,Object? profession = freezed,Object? joiningDate = freezed,Object? finalDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as ProfessionModel?,joiningDate: freezed == joiningDate ? _self.joiningDate : joiningDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finalDate: freezed == finalDate ? _self.finalDate : finalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfessionModelCopyWith<$Res>? get profession {
    if (_self.profession == null) {
    return null;
  }

  return $ProfessionModelCopyWith<$Res>(_self.profession!, (value) {
    return _then(_self.copyWith(profession: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EmployeeModel implements EmployeeModel {
   _EmployeeModel({@JsonKey(name: 'id') this.id, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'avatar') this.avatar, @JsonKey(name: 'email') this.email, @JsonKey(name: 'phone') this.phone, @JsonKey(name: 'profession') this.profession, @JsonKey(name: 'joining_date') this.joiningDate, @JsonKey(name: 'final_date') this.finalDate});
  factory _EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'avatar') final  String? avatar;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'phone') final  String? phone;
@override@JsonKey(name: 'profession') final  ProfessionModel? profession;
@override@JsonKey(name: 'joining_date') final  DateTime? joiningDate;
@override@JsonKey(name: 'final_date') final  DateTime? finalDate;

/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeModelCopyWith<_EmployeeModel> get copyWith => __$EmployeeModelCopyWithImpl<_EmployeeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.joiningDate, joiningDate) || other.joiningDate == joiningDate)&&(identical(other.finalDate, finalDate) || other.finalDate == finalDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatar,email,phone,profession,joiningDate,finalDate);

@override
String toString() {
  return 'EmployeeModel(id: $id, fullName: $fullName, avatar: $avatar, email: $email, phone: $phone, profession: $profession, joiningDate: $joiningDate, finalDate: $finalDate)';
}


}

/// @nodoc
abstract mixin class _$EmployeeModelCopyWith<$Res> implements $EmployeeModelCopyWith<$Res> {
  factory _$EmployeeModelCopyWith(_EmployeeModel value, $Res Function(_EmployeeModel) _then) = __$EmployeeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'email') String? email,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'profession') ProfessionModel? profession,@JsonKey(name: 'joining_date') DateTime? joiningDate,@JsonKey(name: 'final_date') DateTime? finalDate
});


@override $ProfessionModelCopyWith<$Res>? get profession;

}
/// @nodoc
class __$EmployeeModelCopyWithImpl<$Res>
    implements _$EmployeeModelCopyWith<$Res> {
  __$EmployeeModelCopyWithImpl(this._self, this._then);

  final _EmployeeModel _self;
  final $Res Function(_EmployeeModel) _then;

/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? avatar = freezed,Object? email = freezed,Object? phone = freezed,Object? profession = freezed,Object? joiningDate = freezed,Object? finalDate = freezed,}) {
  return _then(_EmployeeModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as ProfessionModel?,joiningDate: freezed == joiningDate ? _self.joiningDate : joiningDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finalDate: freezed == finalDate ? _self.finalDate : finalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of EmployeeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfessionModelCopyWith<$Res>? get profession {
    if (_self.profession == null) {
    return null;
  }

  return $ProfessionModelCopyWith<$Res>(_self.profession!, (value) {
    return _then(_self.copyWith(profession: value));
  });
}
}

// dart format on
