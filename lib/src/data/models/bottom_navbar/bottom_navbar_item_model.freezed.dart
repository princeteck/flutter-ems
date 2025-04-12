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

 int? get index; String? get title; String? get icon;@JsonKey(includeFromJson: false, includeToJson: false) Widget? get widget; bool? get isSelected;@JsonKey(includeFromJson: false, includeToJson: false) VoidCallback? get onTap;
/// Create a copy of BottomNavbarItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomNavbarItemModelCopyWith<BottomNavbarItemModel> get copyWith => _$BottomNavbarItemModelCopyWithImpl<BottomNavbarItemModel>(this as BottomNavbarItemModel, _$identity);

  /// Serializes this BottomNavbarItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomNavbarItemModel&&(identical(other.index, index) || other.index == index)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.widget, widget) || other.widget == widget)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.onTap, onTap) || other.onTap == onTap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,title,icon,widget,isSelected,onTap);

@override
String toString() {
  return 'BottomNavbarItemModel(index: $index, title: $title, icon: $icon, widget: $widget, isSelected: $isSelected, onTap: $onTap)';
}


}

/// @nodoc
abstract mixin class $BottomNavbarItemModelCopyWith<$Res>  {
  factory $BottomNavbarItemModelCopyWith(BottomNavbarItemModel value, $Res Function(BottomNavbarItemModel) _then) = _$BottomNavbarItemModelCopyWithImpl;
@useResult
$Res call({
 int? index, String? title, String? icon,@JsonKey(includeFromJson: false, includeToJson: false) Widget? widget, bool? isSelected,@JsonKey(includeFromJson: false, includeToJson: false) VoidCallback? onTap
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
@pragma('vm:prefer-inline') @override $Res call({Object? index = freezed,Object? title = freezed,Object? icon = freezed,Object? widget = freezed,Object? isSelected = freezed,Object? onTap = freezed,}) {
  return _then(_self.copyWith(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,widget: freezed == widget ? _self.widget : widget // ignore: cast_nullable_to_non_nullable
as Widget?,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _BottomNavbarItemModel implements BottomNavbarItemModel {
   _BottomNavbarItemModel({this.index, this.title, this.icon, @JsonKey(includeFromJson: false, includeToJson: false) this.widget = const SizedBox.shrink(), this.isSelected = false, @JsonKey(includeFromJson: false, includeToJson: false) this.onTap});
  factory _BottomNavbarItemModel.fromJson(Map<String, dynamic> json) => _$BottomNavbarItemModelFromJson(json);

@override final  int? index;
@override final  String? title;
@override final  String? icon;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  Widget? widget;
@override@JsonKey() final  bool? isSelected;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  VoidCallback? onTap;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BottomNavbarItemModel&&(identical(other.index, index) || other.index == index)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.widget, widget) || other.widget == widget)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected)&&(identical(other.onTap, onTap) || other.onTap == onTap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,title,icon,widget,isSelected,onTap);

@override
String toString() {
  return 'BottomNavbarItemModel(index: $index, title: $title, icon: $icon, widget: $widget, isSelected: $isSelected, onTap: $onTap)';
}


}

/// @nodoc
abstract mixin class _$BottomNavbarItemModelCopyWith<$Res> implements $BottomNavbarItemModelCopyWith<$Res> {
  factory _$BottomNavbarItemModelCopyWith(_BottomNavbarItemModel value, $Res Function(_BottomNavbarItemModel) _then) = __$BottomNavbarItemModelCopyWithImpl;
@override @useResult
$Res call({
 int? index, String? title, String? icon,@JsonKey(includeFromJson: false, includeToJson: false) Widget? widget, bool? isSelected,@JsonKey(includeFromJson: false, includeToJson: false) VoidCallback? onTap
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
@override @pragma('vm:prefer-inline') $Res call({Object? index = freezed,Object? title = freezed,Object? icon = freezed,Object? widget = freezed,Object? isSelected = freezed,Object? onTap = freezed,}) {
  return _then(_BottomNavbarItemModel(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,widget: freezed == widget ? _self.widget : widget // ignore: cast_nullable_to_non_nullable
as Widget?,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,onTap: freezed == onTap ? _self.onTap : onTap // ignore: cast_nullable_to_non_nullable
as VoidCallback?,
  ));
}


}

// dart format on
