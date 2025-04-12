import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/base/base_cubit_wrapper.dart';
import '../../../core/base/cubit_status.dart';
import '../../../data/models/profession/profession_model.dart';

part 'profession_state.dart';
part 'profession_cubit.freezed.dart';

@singleton
class ProfessionCubit extends BaseCubitWrapper<ProfessionState> {
  ProfessionCubit() : super(initState);
  static ProfessionState get initState =>
      ProfessionState(status: CubitStatus.initial());
}
