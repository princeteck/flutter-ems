import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_model.freezed.dart';
part 'error_model.g.dart';

@freezed
abstract class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'joining_date') String? joiningDate,
    @JsonKey(name: 'final_date') String? finalDate,
    @JsonKey(name: 'profession_name') String? professionName,
  }) = _ErrorModel;
  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}

extension ErrorModelExtension on ErrorModel {
  bool hasError() {
    final Map<String, dynamic> json = toJson();

    for (final value in json.values) {
      if (value != null) {
        if (value is String && value.isNotEmpty) {
          return true;
        } else if (value is! String) {
          return true;
        }
      }
    }

    return false;
  }
}
