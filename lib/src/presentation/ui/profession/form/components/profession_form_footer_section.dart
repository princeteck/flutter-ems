import 'package:ems/src/core/base/cubit_status.dart';
import 'package:ems/src/core/di/di.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/bloc/profession/profession_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/models/profession/profession_model.dart';
import '../../../../widgets/widgets.dart';

class ProfessionFormFooterSection extends StatelessWidget {
  const ProfessionFormFooterSection({super.key, this.profession});
  final ProfessionModel? profession;
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final cubit = sl<ProfessionCubit>();
    return BlocBuilder<ProfessionCubit, ProfessionState>(
      bloc: cubit,
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondBtnWidget(
                  label: localization.cancel,
                  margin: EdgeInsets.only(right: 12.sp),
                  onPressed: () => cubit.handleCancel(context, profession),
                ),

                PrimaryBtnWidget(
                  label: localization.save,
                  isDisabled: cubit.isSaveDisabled(),
                  isLoading: (state.status == CubitStatus.loading()),
                  onPressed:
                      () =>
                          (state.status == CubitStatus.loading())
                              ? null
                              : cubit.handleSave(context, profession),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
