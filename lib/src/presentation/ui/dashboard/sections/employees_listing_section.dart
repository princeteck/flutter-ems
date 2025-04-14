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

  _init() {
    _localization = AppLocalizations.of(context)!;
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
            title: Text(
              _localization!.employeesList,
              style: context.textTheme.bodyLarge,
            ),
            actions: [
              if (state.employees != null && state.employees!.isNotEmpty)
                IconButton(
                  icon: Icon(Icons.clear_all),
                  onPressed: () {
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
                              onPressed: () {
                                context.pop();
                              },
                              child: Text(
                                _localization!.no,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _cubit.deleteAllEmployees(
                                  context,
                                  _localization!,
                                );
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
                  },
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
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.users,
                                    height: 100.sp,
                                    width: 100.sp,
                                    colorFilter: ColorFilter.mode(
                                      context.colorScheme.error,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  SizedBox(height: 16.sp),
                                  Text(
                                    _localization!.noEmployees,
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.employees?.length ?? 0,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (_, index) {
                                final record = state.employees![index];
                                return Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        flex: 1,
                                        onPressed:
                                            (context) => _cubit.deleteEmployee(
                                              record.id!,
                                              context,
                                              _localization!,
                                            ),
                                        backgroundColor:
                                            context.colorScheme.error,
                                        foregroundColor:
                                            context.colorScheme.onError,
                                        icon: Icons.delete_forever,
                                        label: _localization!.delete,
                                      ),
                                    ],
                                  ),
                                  key: ValueKey(record.id),
                                  child: ListTile(
                                    title: Text(record.fullName ?? ''),
                                    trailing: IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        context.pushNamed(
                                          AddUpdateEmployeeScreen.name,
                                          extra: record,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  right: 16.sp,
                  bottom: 16.sp,
                  child: FloatingActionButton(
                    onPressed: () async {
                      final cubitProfession = sl<ProfessionCubit>();
                      if (cubitProfession.state.professions == null) {
                        await cubitProfession.fetchProfessions();
                      }
                      if (cubitProfession.state.professions?.isEmpty ?? true) {
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text(
                                    _localization!.cancel,
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                          color: context.colorScheme.onSurface,
                                        ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                    context.pushNamed(
                                      AddUpdateProfessionScreen.name,
                                    );
                                  },
                                  child: Text(
                                    _localization!.ok,
                                    style: context.textTheme.bodyLarge
                                        ?.copyWith(
                                          color: context.colorScheme.onSurface,
                                        ),
                                  ),
                                ),
                              ],
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
                            );
                          },
                        );
                        return;
                      } else {
                        context.pushNamed(AddUpdateEmployeeScreen.name);
                      }
                    },
                    child: Icon(Icons.add),
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
