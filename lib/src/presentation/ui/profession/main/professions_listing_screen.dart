import 'package:ems/src/core/config/app_icons.dart';
import 'package:ems/src/core/di/di.dart';
import 'package:ems/src/l10n/app_localizations.dart';
import 'package:ems/src/presentation/bloc/profession/profession_cubit.dart';
import 'package:ems/src/presentation/ui/screens.dart';
import 'package:ems/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:uih/uih.dart';

class ProfessionsListingScreen extends StatefulWidget {
  const ProfessionsListingScreen({super.key});
  static const String name = 'professions_listing';
  static const String path = '/professions_listing';

  @override
  State<ProfessionsListingScreen> createState() =>
      _ProfessionsListingScreenState();
}

class _ProfessionsListingScreenState extends State<ProfessionsListingScreen> {
  late AppLocalizations? _localization;
  final ProfessionCubit _cubit = sl<ProfessionCubit>();
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
    return BlocBuilder<ProfessionCubit, ProfessionState>(
      bloc: _cubit,
      buildWhen: (previous, current) {
        return previous.professions != current.professions;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text(
              _localization!.professionsDashboard,
              style: context.textTheme.bodyLarge,
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.clear_all),
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          _localization!.deleteAllProfessionTitle,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.colorScheme.error,
                          ),
                        ),
                        content: Text(
                          _localization!.deleteAllProfessionsMessage,
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
                              _cubit.deleteAllProfessions();
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
                      await _cubit.fetchProfessions();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if ((state.professions?.length ?? 0) == 0)
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.archiveBoxXMax,
                                    height: 100.sp,
                                    width: 100.sp,
                                    colorFilter: ColorFilter.mode(
                                      context.colorScheme.error,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  SizedBox(height: 16.sp),
                                  Text(
                                    _localization!.noProfessions,
                                    style: context.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.professions?.length ?? 0,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (_, index) {
                                final record = state.professions![index];
                                return Slidable(
                                  endActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        flex: 1,
                                        onPressed:
                                            (context) => _cubit
                                                .deleteProfession(record.id!),
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
                                    title: Text(record.name ?? ''),
                                    trailing: IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        context.pushNamed(
                                          AddUpdateProfessionScreen.name,
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
                    onPressed: () {
                      context.pushNamed(AddUpdateProfessionScreen.name);
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
