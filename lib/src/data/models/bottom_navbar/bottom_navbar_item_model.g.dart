// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navbar_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BottomNavbarItemModel _$BottomNavbarItemModelFromJson(
  Map<String, dynamic> json,
) => _BottomNavbarItemModel(
  index: (json['index'] as num?)?.toInt(),
  title: json['title'] as String?,
  icon: json['icon'] as String?,
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$BottomNavbarItemModelToJson(
  _BottomNavbarItemModel instance,
) => <String, dynamic>{
  'index': instance.index,
  'title': instance.title,
  'icon': instance.icon,
  'isSelected': instance.isSelected,
};
