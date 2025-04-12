// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profession_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfessionModel {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String get name;
/// Create a copy of ProfessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfessionModelCopyWith<ProfessionModel> get copyWith => _$ProfessionModelCopyWithImpl<ProfessionModel>(this as ProfessionModel, _$identity);

  /// Serializes this ProfessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ProfessionModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $ProfessionModelCopyWith<$Res>  {
  factory $ProfessionModelCopyWith(ProfessionModel value, $Res Function(ProfessionModel) _then) = _$ProfessionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$ProfessionModelCopyWithImpl<$Res>
    implements $ProfessionModelCopyWith<$Res> {
  _$ProfessionModelCopyWithImpl(this._self, this._then);

  final ProfessionModel _self;
  final $Res Function(ProfessionModel) _then;

/// Create a copy of ProfessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProfessionModel implements ProfessionModel {
   _ProfessionModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name});
  factory _ProfessionModel.fromJson(Map<String, dynamic> json) => _$ProfessionModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String name;

/// Create a copy of ProfessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfessionModelCopyWith<_ProfessionModel> get copyWith => __$ProfessionModelCopyWithImpl<_ProfessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'ProfessionModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$ProfessionModelCopyWith<$Res> implements $ProfessionModelCopyWith<$Res> {
  factory _$ProfessionModelCopyWith(_ProfessionModel value, $Res Function(_ProfessionModel) _then) = __$ProfessionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$ProfessionModelCopyWithImpl<$Res>
    implements _$ProfessionModelCopyWith<$Res> {
  __$ProfessionModelCopyWithImpl(this._self, this._then);

  final _ProfessionModel _self;
  final $Res Function(_ProfessionModel) _then;

/// Create a copy of ProfessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_ProfessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
