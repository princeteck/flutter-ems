import 'package:ems/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uih/uih.dart';

import '../../../../../core/di/di.dart';
import '../../../../../data/models/profession/profession_model.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../bloc/profession/profession_cubit.dart';

class ProfessionFormBodySection extends StatelessWidget {
  const ProfessionFormBodySection({super.key, this.profession});
  final ProfessionModel? profession;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final cubit = sl<ProfessionCubit>();

    return BlocBuilder<ProfessionCubit, ProfessionState>(
      bloc: cubit,
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16, top: 8),
                      child: CustomInputField(
                        label:
                            profession != null
                                ? localization.nameTheProfessionToBeUpdated
                                : localization.nameTheProfessionToBeAdded,
                        hint: localization.hintProfession,
                        keyboardType: TextInputType.name,
                        initialValue: profession?.name,
                        controller: cubit.controllers[0],
                        prefixIcon: Icon(
                          Icons.work_outline,
                          color: context.colorScheme.primary,
                        ),
                        suffixIcon:
                            (state.profession?.name?.isNotEmpty ?? false)
                                ? IconButton(
                                  icon: Icon(Icons.clear, size: 16.sp),
                                  onPressed: () => cubit.clearField('name'),
                                )
                                : null,
                        validator:
                            (value) => cubit.validateName(value, localization),
                        onChanged: (value) => cubit.updateField('name', value),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
