// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ErrorModel {

@JsonKey(name: 'status') String? get status;@JsonKey(name: 'code') String? get code;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'joining_date') String? get joiningDate;@JsonKey(name: 'final_date') String? get finalDate;@JsonKey(name: 'profession_name') String? get professionName;
/// Create a copy of ErrorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorModelCopyWith<ErrorModel> get copyWith => _$ErrorModelCopyWithImpl<ErrorModel>(this as ErrorModel, _$identity);

  /// Serializes this ErrorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorModel&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.joiningDate, joiningDate) || other.joiningDate == joiningDate)&&(identical(other.finalDate, finalDate) || other.finalDate == finalDate)&&(identical(other.professionName, professionName) || other.professionName == professionName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message,fullName,email,joiningDate,finalDate,professionName);

@override
String toString() {
  return 'ErrorModel(status: $status, code: $code, message: $message, fullName: $fullName, email: $email, joiningDate: $joiningDate, finalDate: $finalDate, professionName: $professionName)';
}


}

/// @nodoc
abstract mixin class $ErrorModelCopyWith<$Res>  {
  factory $ErrorModelCopyWith(ErrorModel value, $Res Function(ErrorModel) _then) = _$ErrorModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'status') String? status,@JsonKey(name: 'code') String? code,@JsonKey(name: 'message') String? message,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'email') String? email,@JsonKey(name: 'joining_date') String? joiningDate,@JsonKey(name: 'final_date') String? finalDate,@JsonKey(name: 'profession_name') String? professionName
});




}
/// @nodoc
class _$ErrorModelCopyWithImpl<$Res>
    implements $ErrorModelCopyWith<$Res> {
  _$ErrorModelCopyWithImpl(this._self, this._then);

  final ErrorModel _self;
  final $Res Function(ErrorModel) _then;

/// Create a copy of ErrorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? code = freezed,Object? message = freezed,Object? fullName = freezed,Object? email = freezed,Object? joiningDate = freezed,Object? finalDate = freezed,Object? professionName = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,joiningDate: freezed == joiningDate ? _self.joiningDate : joiningDate // ignore: cast_nullable_to_non_nullable
as String?,finalDate: freezed == finalDate ? _self.finalDate : finalDate // ignore: cast_nullable_to_non_nullable
as String?,professionName: freezed == professionName ? _self.professionName : professionName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ErrorModel implements ErrorModel {
   _ErrorModel({@JsonKey(name: 'status') this.status, @JsonKey(name: 'code') this.code, @JsonKey(name: 'message') this.message, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'email') this.email, @JsonKey(name: 'joining_date') this.joiningDate, @JsonKey(name: 'final_date') this.finalDate, @JsonKey(name: 'profession_name') this.professionName});
  factory _ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);

@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'code') final  String? code;
@override@JsonKey(name: 'message') final  String? message;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'joining_date') final  String? joiningDate;
@override@JsonKey(name: 'final_date') final  String? finalDate;
@override@JsonKey(name: 'profession_name') final  String? professionName;

/// Create a copy of ErrorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorModelCopyWith<_ErrorModel> get copyWith => __$ErrorModelCopyWithImpl<_ErrorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorModel&&(identical(other.status, status) || other.status == status)&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.joiningDate, joiningDate) || other.joiningDate == joiningDate)&&(identical(other.finalDate, finalDate) || other.finalDate == finalDate)&&(identical(other.professionName, professionName) || other.professionName == professionName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,code,message,fullName,email,joiningDate,finalDate,professionName);

@override
String toString() {
  return 'ErrorModel(status: $status, code: $code, message: $message, fullName: $fullName, email: $email, joiningDate: $joiningDate, finalDate: $finalDate, professionName: $professionName)';
}


}

/// @nodoc
abstract mixin class _$ErrorModelCopyWith<$Res> implements $ErrorModelCopyWith<$Res> {
  factory _$ErrorModelCopyWith(_ErrorModel value, $Res Function(_ErrorModel) _then) = __$ErrorModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'status') String? status,@JsonKey(name: 'code') String? code,@JsonKey(name: 'message') String? message,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'email') String? email,@JsonKey(name: 'joining_date') String? joiningDate,@JsonKey(name: 'final_date') String? finalDate,@JsonKey(name: 'profession_name') String? professionName
});




}
/// @nodoc
class __$ErrorModelCopyWithImpl<$Res>
    implements _$ErrorModelCopyWith<$Res> {
  __$ErrorModelCopyWithImpl(this._self, this._then);

  final _ErrorModel _self;
  final $Res Function(_ErrorModel) _then;

/// Create a copy of ErrorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? code = freezed,Object? message = freezed,Object? fullName = freezed,Object? email = freezed,Object? joiningDate = freezed,Object? finalDate = freezed,Object? professionName = freezed,}) {
  return _then(_ErrorModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,joiningDate: freezed == joiningDate ? _self.joiningDate : joiningDate // ignore: cast_nullable_to_non_nullable
as String?,finalDate: freezed == finalDate ? _self.finalDate : finalDate // ignore: cast_nullable_to_non_nullable
as String?,professionName: freezed == professionName ? _self.professionName : professionName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
