import 'package:ems/gen/assets.gen.dart';
import 'package:ems/src/core/config/app_icons.dart';
import 'package:ems/src/presentation/bloc/profession/profession_cubit.dart';
import 'package:ems/src/presentation/ui/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:uih/uih.dart';

import '../../../../core/di/di.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../bloc/employee/employee_cubit.dart';
import '../../../widgets/widgets.dart';

class EmployeesListingSection extends StatefulWidget {
  const EmployeesListingSection({super.key});

  @override
  State<EmployeesListingSection> createState() =>
      _EmployeesListingSectionState();
}

class _EmployeesListingSectionState extends State<EmployeesListingSection> {
  late AppLocalizations? _localization;
  final EmployeeCubit _cubit = sl<EmployeeCubit>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _init();
  }

  void _init() {
    _localization = AppLocalizations.of(context)!;
  }

  void _showDeleteAllDialog() {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            _localization!.deleteAllEmployeesTitle,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
          content: Text(
            _localization!.deleteAllEmployeesMessage,
            style: context.textTheme.bodyLarge,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                _localization!.no,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _cubit.deleteAllEmployees(context, _localization!);
                context.pop();
              },
              child: Text(
                _localization!.yes,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showNoProfessionsDialog() {
    showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            _localization!.noProfessions,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
          content: Text(
            _localization!.messageNoProfessions,
            style: context.textTheme.bodyLarge,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text(
                _localization!.cancel,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.pop();
                context.pushNamed(AddUpdateProfessionScreen.name);
              },
              child: Text(
                _localization!.ok,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Assets.images.userSearching.image(),
            // SvgPicture.asset(
            //   AppIcons.users,
            //   height: 100.sp,
            //   width: 100.sp,
            //   colorFilter: ColorFilter.mode(
            //     context.colorScheme.error,
            //     BlendMode.srcIn,
            //   ),
            // ),
            SizedBox(height: 16.sp),
            Text(
              _localization!.noEmployees,
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeItem(dynamic record, {bool isPastEmployee = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed:
                  (_) => context.pushNamed(
                    AddUpdateEmployeeScreen.name,
                    extra: record,
                  ),
              backgroundColor: context.colorScheme.primary,
              foregroundColor: context.colorScheme.onPrimary,
              icon: Icons.edit,
              label: _localization!.edit,
            ),
            SlidableAction(
              flex: 1,
              onPressed:
                  (_) => _cubit.deleteEmployee(
                    record.id!,
                    context,
                    _localization!,
                  ),
              backgroundColor: context.colorScheme.error,
              foregroundColor: context.colorScheme.onError,
              icon: Icons.delete_forever,
              label: _localization!.delete,
            ),
          ],
        ),
        key: ValueKey(record.id),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.sp,
            horizontal: 16.sp,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
          tileColor: context.colorScheme.onSurfaceVariant.withAlpha(16),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(record.fullName ?? ''),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.arrowLeftEndOnRectangle,
                    height: 16.sp,
                    colorFilter: ColorFilter.mode(
                      context.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 4.sp),
                  Text(
                    Helper.dateTimeFormatter(
                      dateTime: record.joiningDate,
                      format: 'dd MMM yyyy',
                    ),
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurface,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          subtitle:
              isPastEmployee
                  ? _buildPastEmployeeSubtitle(record)
                  : Text(
                    record.profession?.name ?? '',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colorScheme.onSurface.withAlpha(153),
                    ),
                  ),
        ),
      ),
    );
  }

  Widget _buildPastEmployeeSubtitle(dynamic record) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          record.profession?.name ?? '',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurface.withAlpha(153),
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.arrowRightStartOnRectangle,
              height: 16.sp,
              colorFilter: ColorFilter.mode(
                context.colorScheme.error,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 4.sp),
            Text(
              Helper.dateTimeFormatter(
                dateTime: record.finalDate,
                format: 'dd MMM yyyy',
              ),
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurface,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmployeeList(EmployeeState state) {
    final currentEmployees =
        state.employees?.where((emp) => emp.finalDate == null).toList() ?? [];
    final pastEmployees =
        state.employees?.where((emp) => emp.finalDate != null).toList() ?? [];

    return Expanded(
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          // Current employees section
          if (currentEmployees.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.sp),
              child: Text(
                _localization!.currentEmployees,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...currentEmployees.map((record) => _buildEmployeeItem(record)),
          ],

          // Past employees section
          if (pastEmployees.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.sp),
              child: Text(
                _localization!.pastEmployees,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...pastEmployees.map(
              (record) => _buildEmployeeItem(record, isPastEmployee: true),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _handleAddEmployee() async {
    final cubitProfession = sl<ProfessionCubit>();
    if (cubitProfession.state.professions == null) {
      await cubitProfession.fetchProfessions();
    }
    if (cubitProfession.state.professions?.isEmpty ?? true) {
      _showNoProfessionsDialog();
    } else {
      context.pushNamed(AddUpdateEmployeeScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeCubit, EmployeeState>(
      bloc: _cubit,
      buildWhen: (previous, current) {
        return previous.employees != current.employees;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            leading: null,
            title: Text(_localization!.employeesList),
            actions: [
              if (state.employees != null && state.employees!.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear_all),
                  onPressed: _showDeleteAllDialog,
                ),
            ],
            centerTitle: false,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.sp,
                    vertical: 8.sp,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await _cubit.fetchAllEmployees();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((state.employees?.length ?? 0) == 0)
                          _buildEmptyState()
                        else
                          _buildEmployeeList(state),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 16.sp,
                  bottom: 16.sp,
                  child: FloatingActionButton(
                    onPressed: _handleAddEmployee,
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
