import 'package:freezed_annotation/freezed_annotation.dart';

part 'profession_model.freezed.dart';
part 'profession_model.g.dart';

@freezed
abstract class ProfessionModel with _$ProfessionModel {
  factory ProfessionModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
  }) = _ProfessionModel;
  factory ProfessionModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionModelFromJson(json);
}
