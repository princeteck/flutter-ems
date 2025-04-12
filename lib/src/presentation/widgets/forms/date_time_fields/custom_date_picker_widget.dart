import 'package:ems/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uih/uih.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime?>? onDateSelected;
  final Color? primaryColor;
  final Color? secondaryColor;

  final bool showTodayButton;
  final bool showNoDateButton;
  final bool showNextMondayButton;
  final bool showAfter1WeekButton;

  const CustomDatePicker({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateSelected,
    this.primaryColor,
    this.secondaryColor,
    this.showTodayButton = true,
    this.showNoDateButton = false,
    this.showNextMondayButton = true,
    this.showAfter1WeekButton = false,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();

  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    Color? primaryColor,
    Color? secondaryColor,
    bool showTodayButton = true,
    bool showNoDateButton = false,
    bool showNextMondayButton = true,
    bool showAfter1WeekButton = false,
  }) async {
    return await showDialog<DateTime?>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: CustomDatePicker(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
            showTodayButton: showTodayButton,
            showNoDateButton: showNoDateButton,
            showNextMondayButton: showNextMondayButton,
            showAfter1WeekButton: showAfter1WeekButton,
            onDateSelected: (date) {
              Navigator.of(context).pop(date);
            },
          ),
        );
      },
    );
  }
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime _selectedDate;
  late DateTime _tempSelectedDate;
  late DateTime _currentMonth;
  late List<DateTime> _daysInMonth;
  late List<DateTime> _visibleDays;
  bool _isNoDateSelected = false;
  AppLocalizations? _localization;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _tempSelectedDate = _selectedDate;
    _currentMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    _generateDays();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localization = AppLocalizations.of(context);
  }

  void _generateDays() {
    _daysInMonth = _getDaysInMonth(_currentMonth);

    _visibleDays = _getVisibleDays();
  }

  List<DateTime> _getDaysInMonth(DateTime month) {
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

    return List.generate(
      lastDayOfMonth.day,
      (index) => DateTime(month.year, month.month, index + 1),
    );
  }

  List<DateTime> _getVisibleDays() {
    final firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    );

    final daysFromPreviousMonth = firstDayOfMonth.weekday % 7;

    List<DateTime> visibleDays = [];

    if (daysFromPreviousMonth > 0) {
      final prevMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month - 1,
        1,
      );
      final daysInPrevMonth =
          DateTime(_currentMonth.year, _currentMonth.month, 0).day;

      for (
        int i = daysInPrevMonth - daysFromPreviousMonth + 1;
        i <= daysInPrevMonth;
        i++
      ) {
        visibleDays.add(DateTime(prevMonth.year, prevMonth.month, i));
      }
    }

    visibleDays.addAll(_daysInMonth);

    final daysFromNextMonth = 42 - visibleDays.length;
    if (daysFromNextMonth > 0) {
      final nextMonth = DateTime(
        _currentMonth.year,
        _currentMonth.month + 1,
        1,
      );

      for (int i = 1; i <= daysFromNextMonth; i++) {
        visibleDays.add(DateTime(nextMonth.year, nextMonth.month, i));
      }
    }

    return visibleDays;
  }

  void _selectDate(DateTime date) {
    setState(() {
      _tempSelectedDate = date;
      _isNoDateSelected = false;
    });
  }

  void _saveSelectedDate() {
    if (!_isNoDateSelected) {
      _selectedDate = _tempSelectedDate;

      // Notify listeners
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(_selectedDate);
      }
    } else {
      // If "No Date" is selected, pass null
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(null);
      }
    }
  }

  void _cancelSelection() {
    if (widget.onDateSelected != null) {
      widget.onDateSelected!(null);
    }
  }

  void _goToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
      _generateDays();
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
      _generateDays();
    });
  }

  // New methods for quick action buttons
  void _selectToday() {
    setState(() {
      final today = DateTime.now();
      _tempSelectedDate = today;
      _currentMonth = DateTime(today.year, today.month, 1);
      _isNoDateSelected = false;
      _generateDays();
    });
  }

  void _selectNoDate() {
    setState(() {
      _isNoDateSelected = true;
    });
  }

  void _selectNextMonday() {
    setState(() {
      final today = DateTime.now();
      int daysUntilNextMonday = (8 - today.weekday) % 7;
      if (daysUntilNextMonday == 0) {
        daysUntilNextMonday = 7;
      }

      _tempSelectedDate = today.add(Duration(days: daysUntilNextMonday));
      _currentMonth = DateTime(
        _tempSelectedDate.year,
        _tempSelectedDate.month,
        1,
      );
      _isNoDateSelected = false;
      _generateDays();
    });
  }

  void _selectAfter1Week() {
    setState(() {
      final today = DateTime.now();
      _tempSelectedDate = today.add(const Duration(days: 7));
      _currentMonth = DateTime(
        _tempSelectedDate.year,
        _tempSelectedDate.month,
        1,
      );
      _isNoDateSelected = false;
      _generateDays();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 320.sp,
      height: 480.sp,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Quick selection buttons
          _buildQuickSelectionButtons(context),

          const SizedBox(height: 8),

          // Month/Year navigation
          _buildMonthYearHeader(context),

          const SizedBox(height: 8),

          // Weekday headers
          _buildWeekdayHeaders(context),

          // Calendar grid
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1.0,
              ),
              itemCount: _visibleDays.length,
              itemBuilder: (context, index) {
                final date = _visibleDays[index];
                final isCurrentMonth = date.month == _currentMonth.month;
                final isSelected =
                    date.day == _selectedDate.day &&
                    date.month == _selectedDate.month &&
                    date.year == _selectedDate.year;
                final isTodayDate =
                    date.day == DateTime.now().day &&
                    date.month == DateTime.now().month &&
                    date.year == DateTime.now().year;

                return _buildDayCell(
                  context,
                  date,
                  isCurrentMonth,
                  isSelected,
                  isTodayDate,
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildQuickSelectionButtons(BuildContext context) {
    List<Widget> quickButtons = [];

    if (widget.showTodayButton) {
      quickButtons.add(
        _buildQuickSelectButton(
          context,
          _localization!.today,
          _selectToday,
          isSelected:
              !_isNoDateSelected &&
              _isSameDay(_tempSelectedDate, DateTime.now()),
        ),
      );
    }

    if (widget.showNoDateButton) {
      quickButtons.add(
        _buildQuickSelectButton(
          context,
          _localization!.noDate,
          _selectNoDate,
          isSelected: _isNoDateSelected,
        ),
      );
    }

    if (widget.showNextMondayButton) {
      final today = DateTime.now();
      int daysUntilNextMonday = (8 - today.weekday) % 7;
      if (daysUntilNextMonday == 0) daysUntilNextMonday = 7;
      final nextMonday = today.add(Duration(days: daysUntilNextMonday));

      quickButtons.add(
        _buildQuickSelectButton(
          context,
          _localization!.nextMonday,
          _selectNextMonday,
          isSelected:
              !_isNoDateSelected && _isSameDay(_tempSelectedDate, nextMonday),
        ),
      );
    }

    if (widget.showAfter1WeekButton) {
      final today = DateTime.now();
      final afterOneWeek = today.add(const Duration(days: 7));

      quickButtons.add(
        _buildQuickSelectButton(
          context,
          _localization!.afterOneWeek,
          _selectAfter1Week,
          isSelected:
              !_isNoDateSelected && _isSameDay(_tempSelectedDate, afterOneWeek),
        ),
      );
    }

    List<Widget> rows = [];
    for (int i = 0; i < quickButtons.length; i += 2) {
      List<Widget> rowButtons = [];

      rowButtons.add(Expanded(child: quickButtons[i]));

      if (i + 1 < quickButtons.length) {
        rowButtons.add(Expanded(child: quickButtons[i + 1]));
      } else {
        rowButtons.add(Expanded(child: Container()));
      }

      rows.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(children: rowButtons),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: rows,
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget _buildQuickSelectButton(
    BuildContext context,
    String text,
    VoidCallback onPressed, {
    required bool isSelected,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final primaryColor = widget.primaryColor ?? colorScheme.primary;

    final lightPrimaryColor = Color.alphaBlend(
      primaryColor.withAlpha(26),
      colorScheme.surface,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? primaryColor : lightPrimaryColor,
          foregroundColor: isSelected ? colorScheme.onPrimary : primaryColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: context.textTheme.bodySmall?.copyWith(
            color: isSelected ? colorScheme.onPrimary : primaryColor,
            fontWeight: isSelected ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }

  Widget _buildMonthYearHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: _goToPreviousMonth,
          tooltip: _localization!.previousMonth,
        ),
        GestureDetector(
          onTap: () => _showMonthYearPicker(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '${_getMonthName(_currentMonth.month)} ${_currentMonth.year}',
              style: theme.textTheme.titleMedium,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: _goToNextMonth,
          tooltip: _localization!.nextMonth,
        ),
      ],
    );
  }

  // Fix for the month/year picker dialog result handling
  Future<void> _showMonthYearPicker(BuildContext context) async {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Show a custom month/year picker dialog
    final result = await showDialog<Map<String, int>>(
      context: context,
      builder: (context) {
        int selectedYear = _currentMonth.year;
        int selectedMonth = _currentMonth.month;

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(_localization!.selectMonthAndYear),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Year picker
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            selectedYear--;
                          });
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            selectedYear.toString(),
                            style: theme.textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            selectedYear++;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.center,
                    children: List.generate(12, (index) {
                      final month = index + 1;
                      final isSelected = month == selectedMonth;

                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedMonth = month;
                          });
                        },
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          width: 80,
                          height: 40,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? colorScheme.primary
                                    : Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                            border:
                                !isSelected
                                    ? Border.all(
                                      color: colorScheme.outline.withAlpha(
                                        77,
                                      ), // 0.3 opacity = 77 alpha
                                    )
                                    : null,
                          ),
                          child: Center(
                            child: Text(
                              _getMonthName(month, short: true),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color:
                                    isSelected ? colorScheme.onPrimary : null,
                                fontWeight: isSelected ? FontWeight.bold : null,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(_localization!.cancel),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop({
                      'year':
                          selectedYear, // Fixed: Use string literals instead of localized strings
                      'month':
                          selectedMonth, // Fixed: Use string literals instead of localized strings
                    });
                  },
                  child: Text(_localization!.ok),
                ),
              ],
            );
          },
        );
      },
    );

    if (result != null &&
        result.containsKey('year') &&
        result.containsKey('month')) {
      setState(() {
        _currentMonth = DateTime(
          result['year']!, // Use non-null assertion since we checked containsKey
          result['month']!, // Use non-null assertion since we checked containsKey
          1,
        );
        _generateDays();
      });
    }
  }

  Widget _buildWeekdayHeaders(BuildContext context) {
    final theme = Theme.of(context);
    final weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
          weekDays
              .map(
                (day) => SizedBox(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: Text(
                      day,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildDayCell(
    BuildContext context,
    DateTime date,
    bool isCurrentMonth,
    bool isSelected,
    bool isToday,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final primaryColor = widget.primaryColor ?? colorScheme.primary;

    final isSelectedTemp =
        date.day == _tempSelectedDate.day &&
        date.month == _tempSelectedDate.month &&
        date.year == _tempSelectedDate.year;

    final isTodayDate =
        date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year;

    final backgroundColor =
        isSelectedTemp
            ? primaryColor
            : isTodayDate
            ? primaryColor.withAlpha(26)
            : Colors.transparent;

    final textColor =
        isSelectedTemp
            ? colorScheme.onPrimary
            : !isCurrentMonth
            ? colorScheme.onSurface.withAlpha(77)
            : colorScheme.onSurface;

    final Border? dateBorder =
        (isTodayDate && !isSelectedTemp)
            ? Border.all(color: primaryColor, width: 1.5)
            : null;

    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: isCurrentMonth ? () => _selectDate(date) : null,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: dateBorder,
        ),
        child: Center(
          child: Text(
            date.day.toString(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight:
                  isSelectedTemp || isTodayDate ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final String formattedDate =
        _isNoDateSelected
            ? "No Date"
            : '${_tempSelectedDate.day} ${_getMonthName(_tempSelectedDate.month, short: true)} ${_tempSelectedDate.year}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              _isNoDateSelected ? Icons.event_busy : Icons.event,
              size: 18,
              color: colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(formattedDate, style: theme.textTheme.bodyMedium),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _cancelSelection,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary.withAlpha(26),
                foregroundColor: context.colorScheme.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                _localization!.cancel,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: _saveSelectedDate,
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Text(
                _localization!.save,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getMonthName(int month, {bool short = false}) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    const shortMonths = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return short ? shortMonths[month - 1] : months[month - 1];
  }
}

// Example usage:
class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? _selectedDate;
  AppLocalizations? _localization;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localization = AppLocalizations.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_localization!.selectDate)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedDate != null
                  ? '${_localization!.dateSelected}: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                  : _localization!.noDateSelected,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final date = await CustomDatePicker.show(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  showTodayButton: true,
                  showNoDateButton: true,
                  showNextMondayButton: true,
                  showAfter1WeekButton: true,
                );

                setState(() {
                  _selectedDate = date;
                });
              },
              child: Text(_localization!.selectDate),
            ),
          ],
        ),
      ),
    );
  }
}
