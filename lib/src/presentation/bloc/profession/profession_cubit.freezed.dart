// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profession_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfessionState {

@JsonKey(includeFromJson: false, includeToJson: false) BaseCubitStatus get status; List<ProfessionModel>? get professions; ProfessionModel? get profession; ErrorModel? get errors; int? get professionCount;
/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfessionStateCopyWith<ProfessionState> get copyWith => _$ProfessionStateCopyWithImpl<ProfessionState>(this as ProfessionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.professions, professions)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.errors, errors) || other.errors == errors)&&(identical(other.professionCount, professionCount) || other.professionCount == professionCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(professions),profession,errors,professionCount);

@override
String toString() {
  return 'ProfessionState(status: $status, professions: $professions, profession: $profession, errors: $errors, professionCount: $professionCount)';
}


}

/// @nodoc
abstract mixin class $ProfessionStateCopyWith<$Res>  {
  factory $ProfessionStateCopyWith(ProfessionState value, $Res Function(ProfessionState) _then) = _$ProfessionStateCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) BaseCubitStatus status, List<ProfessionModel>? professions, ProfessionModel? profession, ErrorModel? errors, int? professionCount
});


$ProfessionModelCopyWith<$Res>? get profession;$ErrorModelCopyWith<$Res>? get errors;

}
/// @nodoc
class _$ProfessionStateCopyWithImpl<$Res>
    implements $ProfessionStateCopyWith<$Res> {
  _$ProfessionStateCopyWithImpl(this._self, this._then);

  final ProfessionState _self;
  final $Res Function(ProfessionState) _then;

/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? professions = freezed,Object? profession = freezed,Object? errors = freezed,Object? professionCount = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseCubitStatus,professions: freezed == professions ? _self.professions : professions // ignore: cast_nullable_to_non_nullable
as List<ProfessionModel>?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as ProfessionModel?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as ErrorModel?,professionCount: freezed == professionCount ? _self.professionCount : professionCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ProfessionState
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
}/// Create a copy of ProfessionState
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


class _ProfessionState implements ProfessionState {
  const _ProfessionState({@JsonKey(includeFromJson: false, includeToJson: false) required this.status, final  List<ProfessionModel>? professions, this.profession, this.errors, this.professionCount = 0}): _professions = professions;
  

@override@JsonKey(includeFromJson: false, includeToJson: false) final  BaseCubitStatus status;
 final  List<ProfessionModel>? _professions;
@override List<ProfessionModel>? get professions {
  final value = _professions;
  if (value == null) return null;
  if (_professions is EqualUnmodifiableListView) return _professions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  ProfessionModel? profession;
@override final  ErrorModel? errors;
@override@JsonKey() final  int? professionCount;

/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfessionStateCopyWith<_ProfessionState> get copyWith => __$ProfessionStateCopyWithImpl<_ProfessionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfessionState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._professions, _professions)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.errors, errors) || other.errors == errors)&&(identical(other.professionCount, professionCount) || other.professionCount == professionCount));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_professions),profession,errors,professionCount);

@override
String toString() {
  return 'ProfessionState(status: $status, professions: $professions, profession: $profession, errors: $errors, professionCount: $professionCount)';
}


}

/// @nodoc
abstract mixin class _$ProfessionStateCopyWith<$Res> implements $ProfessionStateCopyWith<$Res> {
  factory _$ProfessionStateCopyWith(_ProfessionState value, $Res Function(_ProfessionState) _then) = __$ProfessionStateCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeFromJson: false, includeToJson: false) BaseCubitStatus status, List<ProfessionModel>? professions, ProfessionModel? profession, ErrorModel? errors, int? professionCount
});


@override $ProfessionModelCopyWith<$Res>? get profession;@override $ErrorModelCopyWith<$Res>? get errors;

}
/// @nodoc
class __$ProfessionStateCopyWithImpl<$Res>
    implements _$ProfessionStateCopyWith<$Res> {
  __$ProfessionStateCopyWithImpl(this._self, this._then);

  final _ProfessionState _self;
  final $Res Function(_ProfessionState) _then;

/// Create a copy of ProfessionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? professions = freezed,Object? profession = freezed,Object? errors = freezed,Object? professionCount = freezed,}) {
  return _then(_ProfessionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BaseCubitStatus,professions: freezed == professions ? _self._professions : professions // ignore: cast_nullable_to_non_nullable
as List<ProfessionModel>?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as ProfessionModel?,errors: freezed == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as ErrorModel?,professionCount: freezed == professionCount ? _self.professionCount : professionCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ProfessionState
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
}/// Create a copy of ProfessionState
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
