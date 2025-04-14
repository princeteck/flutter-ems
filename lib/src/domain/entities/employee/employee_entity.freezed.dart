// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeEntity {

@JsonKey(name: 'id') String? get id;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'avatar') String? get avatar;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'phone') String? get phone;@JsonKey(name: 'profession') ProfessionEntity? get profession;@JsonKey(name: 'joining_date') DateTime? get joiningDate;@JsonKey(name: 'final_date') DateTime? get finalDate;
/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeEntityCopyWith<EmployeeEntity> get copyWith => _$EmployeeEntityCopyWithImpl<EmployeeEntity>(this as EmployeeEntity, _$identity);

  /// Serializes this EmployeeEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.joiningDate, joiningDate) || other.joiningDate == joiningDate)&&(identical(other.finalDate, finalDate) || other.finalDate == finalDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatar,email,phone,profession,joiningDate,finalDate);

@override
String toString() {
  return 'EmployeeEntity(id: $id, fullName: $fullName, avatar: $avatar, email: $email, phone: $phone, profession: $profession, joiningDate: $joiningDate, finalDate: $finalDate)';
}


}

/// @nodoc
abstract mixin class $EmployeeEntityCopyWith<$Res>  {
  factory $EmployeeEntityCopyWith(EmployeeEntity value, $Res Function(EmployeeEntity) _then) = _$EmployeeEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'email') String? email,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'profession') ProfessionEntity? profession,@JsonKey(name: 'joining_date') DateTime? joiningDate,@JsonKey(name: 'final_date') DateTime? finalDate
});


$ProfessionEntityCopyWith<$Res>? get profession;

}
/// @nodoc
class _$EmployeeEntityCopyWithImpl<$Res>
    implements $EmployeeEntityCopyWith<$Res> {
  _$EmployeeEntityCopyWithImpl(this._self, this._then);

  final EmployeeEntity _self;
  final $Res Function(EmployeeEntity) _then;

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,Object? avatar = freezed,Object? email = freezed,Object? phone = freezed,Object? profession = freezed,Object? joiningDate = freezed,Object? finalDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as ProfessionEntity?,joiningDate: freezed == joiningDate ? _self.joiningDate : joiningDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finalDate: freezed == finalDate ? _self.finalDate : finalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfessionEntityCopyWith<$Res>? get profession {
    if (_self.profession == null) {
    return null;
  }

  return $ProfessionEntityCopyWith<$Res>(_self.profession!, (value) {
    return _then(_self.copyWith(profession: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _EmployeeEntity implements EmployeeEntity {
   _EmployeeEntity({@JsonKey(name: 'id') this.id, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'avatar') this.avatar, @JsonKey(name: 'email') this.email, @JsonKey(name: 'phone') this.phone, @JsonKey(name: 'profession') this.profession, @JsonKey(name: 'joining_date') this.joiningDate, @JsonKey(name: 'final_date') this.finalDate});
  factory _EmployeeEntity.fromJson(Map<String, dynamic> json) => _$EmployeeEntityFromJson(json);

@override@JsonKey(name: 'id') final  String? id;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'avatar') final  String? avatar;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'phone') final  String? phone;
@override@JsonKey(name: 'profession') final  ProfessionEntity? profession;
@override@JsonKey(name: 'joining_date') final  DateTime? joiningDate;
@override@JsonKey(name: 'final_date') final  DateTime? finalDate;

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeEntityCopyWith<_EmployeeEntity> get copyWith => __$EmployeeEntityCopyWithImpl<_EmployeeEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.joiningDate, joiningDate) || other.joiningDate == joiningDate)&&(identical(other.finalDate, finalDate) || other.finalDate == finalDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatar,email,phone,profession,joiningDate,finalDate);

@override
String toString() {
  return 'EmployeeEntity(id: $id, fullName: $fullName, avatar: $avatar, email: $email, phone: $phone, profession: $profession, joiningDate: $joiningDate, finalDate: $finalDate)';
}


}

/// @nodoc
abstract mixin class _$EmployeeEntityCopyWith<$Res> implements $EmployeeEntityCopyWith<$Res> {
  factory _$EmployeeEntityCopyWith(_EmployeeEntity value, $Res Function(_EmployeeEntity) _then) = __$EmployeeEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String? id,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'avatar') String? avatar,@JsonKey(name: 'email') String? email,@JsonKey(name: 'phone') String? phone,@JsonKey(name: 'profession') ProfessionEntity? profession,@JsonKey(name: 'joining_date') DateTime? joiningDate,@JsonKey(name: 'final_date') DateTime? finalDate
});


@override $ProfessionEntityCopyWith<$Res>? get profession;

}
/// @nodoc
class __$EmployeeEntityCopyWithImpl<$Res>
    implements _$EmployeeEntityCopyWith<$Res> {
  __$EmployeeEntityCopyWithImpl(this._self, this._then);

  final _EmployeeEntity _self;
  final $Res Function(_EmployeeEntity) _then;

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? avatar = freezed,Object? email = freezed,Object? phone = freezed,Object? profession = freezed,Object? joiningDate = freezed,Object? finalDate = freezed,}) {
  return _then(_EmployeeEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as ProfessionEntity?,joiningDate: freezed == joiningDate ? _self.joiningDate : joiningDate // ignore: cast_nullable_to_non_nullable
as DateTime?,finalDate: freezed == finalDate ? _self.finalDate : finalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfessionEntityCopyWith<$Res>? get profession {
    if (_self.profession == null) {
    return null;
  }

  return $ProfessionEntityCopyWith<$Res>(_self.profession!, (value) {
    return _then(_self.copyWith(profession: value));
  });
}
}

// dart format on
