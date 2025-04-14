import 'package:freezed_annotation/freezed_annotation.dart';

part 'profession_entity.freezed.dart';
part 'profession_entity.g.dart';

@freezed
abstract class ProfessionEntity with _$ProfessionEntity {
  factory ProfessionEntity({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProfessionEntity;
  factory ProfessionEntity.fromJson(Map<String, dynamic> json) =>
      _$ProfessionEntityFromJson(json);
}

extension ProfessionEntityExtension on ProfessionEntity {
  asMap() {
    final Map<String, dynamic> data = Map<String, dynamic>.from(toJson());
    return data;
  }
}
