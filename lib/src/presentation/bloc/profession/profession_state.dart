part of 'profession_cubit.dart';

@freezed
abstract class ProfessionState with _$ProfessionState {
  const factory ProfessionState({
    @JsonKey(includeFromJson: false, includeToJson: false)
    required BaseCubitStatus status,
    List<ProfessionModel>? professions,
  }) = _ProfessionState;
}
