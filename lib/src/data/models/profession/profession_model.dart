import 'package:freezed_annotation/freezed_annotation.dart';

part 'profession_model.freezed.dart';
part 'profession_model.g.dart';

@freezed
abstract class ProfessionModel with _$ProfessionModel {
  factory ProfessionModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ProfessionModel;
  factory ProfessionModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionModelFromJson(json);
}

extension EmployeeModelExtension on ProfessionModel {
  isComplete() {
    final Map<String, dynamic> json = Map<String, dynamic>.from(toJson());
    json.removeWhere(
      (key, value) => key == 'id' || key == 'created_at' || key == 'updated_at',
    );
    for (final value in json.values) {
      if (value != null) {
        if (value is String && value.isEmpty) {
          return true;
        } else if (value is! String) {
          return true;
        }
      } else {
        return true;
      }
    }
    return false;
  }

  asMap() {
    final Map<String, dynamic> data = Map<String, dynamic>.from(toJson());
    return data;
  }
}
