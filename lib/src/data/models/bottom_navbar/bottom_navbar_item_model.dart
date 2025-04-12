import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navbar_item_model.freezed.dart';
part 'bottom_navbar_item_model.g.dart';

@freezed
abstract class BottomNavbarItemModel with _$BottomNavbarItemModel {
  factory BottomNavbarItemModel({
    int? index,
    String? title,
    String? icon,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(SizedBox.shrink())
    Widget? widget,
    @Default(false) bool? isSelected,
    @JsonKey(includeFromJson: false, includeToJson: false) VoidCallback? onTap,
  }) = _BottomNavbarItemModel;
  factory BottomNavbarItemModel.fromJson(Map<String, dynamic> json) =>
      _$BottomNavbarItemModelFromJson(json);
}
