part of 'profession_cubit.dart';

@freezed
abstract class ProfessionState with _$ProfessionState {
  const factory ProfessionState({
    @JsonKey(includeFromJson: false, includeToJson: false)
    required BaseCubitStatus status,
    List<ProfessionModel>? professions,
    ProfessionModel? profession,
    ErrorModel? errors,
    @Default(0) int? professionCount,
  }) = _ProfessionState;
}
