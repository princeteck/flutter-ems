// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_navbar_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BottomNavbarItemModel {

 int get index; String get title; String get icon; String get route; bool get isSelected;
/// Create a copy of BottomNavbarItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomNavbarItemModelCopyWith<BottomNavbarItemModel> get copyWith => _$BottomNavbarItemModelCopyWithImpl<BottomNavbarItemModel>(this as BottomNavbarItemModel, _$identity);

  /// Serializes this BottomNavbarItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomNavbarItemModel&&(identical(other.index, index) || other.index == index)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.route, route) || other.route == route)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,title,icon,route,isSelected);

@override
String toString() {
  return 'BottomNavbarItemModel(index: $index, title: $title, icon: $icon, route: $route, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $BottomNavbarItemModelCopyWith<$Res>  {
  factory $BottomNavbarItemModelCopyWith(BottomNavbarItemModel value, $Res Function(BottomNavbarItemModel) _then) = _$BottomNavbarItemModelCopyWithImpl;
@useResult
$Res call({
 int index, String title, String icon, String route, bool isSelected
});




}
/// @nodoc
class _$BottomNavbarItemModelCopyWithImpl<$Res>
    implements $BottomNavbarItemModelCopyWith<$Res> {
  _$BottomNavbarItemModelCopyWithImpl(this._self, this._then);

  final BottomNavbarItemModel _self;
  final $Res Function(BottomNavbarItemModel) _then;

/// Create a copy of BottomNavbarItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? title = null,Object? icon = null,Object? route = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BottomNavbarItemModel implements BottomNavbarItemModel {
   _BottomNavbarItemModel({required this.index, required this.title, required this.icon, required this.route, required this.isSelected});
  factory _BottomNavbarItemModel.fromJson(Map<String, dynamic> json) => _$BottomNavbarItemModelFromJson(json);

@override final  int index;
@override final  String title;
@override final  String icon;
@override final  String route;
@override final  bool isSelected;

/// Create a copy of BottomNavbarItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BottomNavbarItemModelCopyWith<_BottomNavbarItemModel> get copyWith => __$BottomNavbarItemModelCopyWithImpl<_BottomNavbarItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BottomNavbarItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BottomNavbarItemModel&&(identical(other.index, index) || other.index == index)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.route, route) || other.route == route)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,title,icon,route,isSelected);

@override
String toString() {
  return 'BottomNavbarItemModel(index: $index, title: $title, icon: $icon, route: $route, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$BottomNavbarItemModelCopyWith<$Res> implements $BottomNavbarItemModelCopyWith<$Res> {
  factory _$BottomNavbarItemModelCopyWith(_BottomNavbarItemModel value, $Res Function(_BottomNavbarItemModel) _then) = __$BottomNavbarItemModelCopyWithImpl;
@override @useResult
$Res call({
 int index, String title, String icon, String route, bool isSelected
});




}
/// @nodoc
class __$BottomNavbarItemModelCopyWithImpl<$Res>
    implements _$BottomNavbarItemModelCopyWith<$Res> {
  __$BottomNavbarItemModelCopyWithImpl(this._self, this._then);

  final _BottomNavbarItemModel _self;
  final $Res Function(_BottomNavbarItemModel) _then;

/// Create a copy of BottomNavbarItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? title = null,Object? icon = null,Object? route = null,Object? isSelected = null,}) {
  return _then(_BottomNavbarItemModel(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as String,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
