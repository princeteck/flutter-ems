import 'package:ems/src/presentation/ui/employee/add_update_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uih/uih.dart';

class EmployeesListingSection extends StatefulWidget {
  const EmployeesListingSection({super.key});

  @override
  State<EmployeesListingSection> createState() =>
      _EmployeesListingSectionState();
}

class _EmployeesListingSectionState extends State<EmployeesListingSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Employees Listing',
                    textAlign: TextAlign.left,
                    style: context.textTheme.headlineSmall?.copyWith(),
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return Text('Employee $index');
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: () {
                context.pushNamed(AddUpdateEmployeeScreen.name);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
