// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SystemState {

 ThemeData? get theme; String? get appName; String? get appVersion; String? get appBuildNumber; ThemeMode? get themeMode; bool? get isDarkMode;
/// Create a copy of SystemState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SystemStateCopyWith<SystemState> get copyWith => _$SystemStateCopyWithImpl<SystemState>(this as SystemState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SystemState&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.appBuildNumber, appBuildNumber) || other.appBuildNumber == appBuildNumber)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}


@override
int get hashCode => Object.hash(runtimeType,theme,appName,appVersion,appBuildNumber,themeMode,isDarkMode);

@override
String toString() {
  return 'SystemState(theme: $theme, appName: $appName, appVersion: $appVersion, appBuildNumber: $appBuildNumber, themeMode: $themeMode, isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class $SystemStateCopyWith<$Res>  {
  factory $SystemStateCopyWith(SystemState value, $Res Function(SystemState) _then) = _$SystemStateCopyWithImpl;
@useResult
$Res call({
 ThemeData? theme, String? appName, String? appVersion, String? appBuildNumber, ThemeMode? themeMode, bool? isDarkMode
});




}
/// @nodoc
class _$SystemStateCopyWithImpl<$Res>
    implements $SystemStateCopyWith<$Res> {
  _$SystemStateCopyWithImpl(this._self, this._then);

  final SystemState _self;
  final $Res Function(SystemState) _then;

/// Create a copy of SystemState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = freezed,Object? appName = freezed,Object? appVersion = freezed,Object? appBuildNumber = freezed,Object? themeMode = freezed,Object? isDarkMode = freezed,}) {
  return _then(_self.copyWith(
theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemeData?,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,appBuildNumber: freezed == appBuildNumber ? _self.appBuildNumber : appBuildNumber // ignore: cast_nullable_to_non_nullable
as String?,themeMode: freezed == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode?,isDarkMode: freezed == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc


class _SystemState implements SystemState {
  const _SystemState({this.theme, this.appName, this.appVersion, this.appBuildNumber, this.themeMode = ThemeMode.system, this.isDarkMode = false});
  

@override final  ThemeData? theme;
@override final  String? appName;
@override final  String? appVersion;
@override final  String? appBuildNumber;
@override@JsonKey() final  ThemeMode? themeMode;
@override@JsonKey() final  bool? isDarkMode;

/// Create a copy of SystemState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SystemStateCopyWith<_SystemState> get copyWith => __$SystemStateCopyWithImpl<_SystemState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SystemState&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.appName, appName) || other.appName == appName)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.appBuildNumber, appBuildNumber) || other.appBuildNumber == appBuildNumber)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}


@override
int get hashCode => Object.hash(runtimeType,theme,appName,appVersion,appBuildNumber,themeMode,isDarkMode);

@override
String toString() {
  return 'SystemState(theme: $theme, appName: $appName, appVersion: $appVersion, appBuildNumber: $appBuildNumber, themeMode: $themeMode, isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class _$SystemStateCopyWith<$Res> implements $SystemStateCopyWith<$Res> {
  factory _$SystemStateCopyWith(_SystemState value, $Res Function(_SystemState) _then) = __$SystemStateCopyWithImpl;
@override @useResult
$Res call({
 ThemeData? theme, String? appName, String? appVersion, String? appBuildNumber, ThemeMode? themeMode, bool? isDarkMode
});




}
/// @nodoc
class __$SystemStateCopyWithImpl<$Res>
    implements _$SystemStateCopyWith<$Res> {
  __$SystemStateCopyWithImpl(this._self, this._then);

  final _SystemState _self;
  final $Res Function(_SystemState) _then;

/// Create a copy of SystemState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theme = freezed,Object? appName = freezed,Object? appVersion = freezed,Object? appBuildNumber = freezed,Object? themeMode = freezed,Object? isDarkMode = freezed,}) {
  return _then(_SystemState(
theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as ThemeData?,appName: freezed == appName ? _self.appName : appName // ignore: cast_nullable_to_non_nullable
as String?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,appBuildNumber: freezed == appBuildNumber ? _self.appBuildNumber : appBuildNumber // ignore: cast_nullable_to_non_nullable
as String?,themeMode: freezed == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode?,isDarkMode: freezed == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
