import 'package:ems/src/core/di/di.dart';
import 'package:ems/src/data/models/profession/profession_model.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/bloc/profession/profession_cubit.dart';
import 'package:ems/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/components.dart';

class AddUpdateProfessionScreen extends StatefulWidget {
  const AddUpdateProfessionScreen({super.key, this.profession});
  static const String name = 'add_update_profession';
  static const String path = '/add_update_profession';
  final ProfessionModel? profession;

  @override
  State<AddUpdateProfessionScreen> createState() =>
      _AddUpdateProfessionScreenState();
}

class _AddUpdateProfessionScreenState extends State<AddUpdateProfessionScreen> {
  final ProfessionCubit _cubit = sl<ProfessionCubit>();

  @override
  void initState() {
    _cubit.clearProfessionForm();
    if (widget.profession != null) {
      _cubit.setProfessionData(widget.profession);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localization = AppLocalizations.of(context);
    return BlocBuilder<ProfessionCubit, ProfessionState>(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text(
              widget.profession == null
                  ? localization!.addProfession
                  : localization!.updateProfession,
            ),
          ),
          bottomNavigationBar: ProfessionFormFooterSection(
            profession: widget.profession,
          ),
          body: ProfessionFormBodySection(profession: widget.profession),
        );
      },
    );
  }
}
