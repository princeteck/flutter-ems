import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navbar_item_model.freezed.dart';
part 'bottom_navbar_item_model.g.dart';

@freezed
abstract class BottomNavbarItemModel with _$BottomNavbarItemModel {
  factory BottomNavbarItemModel({
    required int index,
    required String title,
    required String icon,
    required String route,
    required bool isSelected,
  }) = _BottomNavbarItemModel;
  factory BottomNavbarItemModel.fromJson(Map<String, dynamic> json) =>
      _$BottomNavbarItemModelFromJson(json);
}
