import 'package:flutter/material.dart';
import '../../../../data/models/bottom_navbar/bottom_navbar_item_model.dart';

class BottomNavbarSection extends StatelessWidget {
  const BottomNavbarSection({
    super.key,
    this.onTap,
    required this.selectedIndex,
    required this.items,
  });
  final VoidCallback? onTap;
  final int selectedIndex;
  final List<BottomNavbarItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2F),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children:
            items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == index
                            ? const Color(0xFF3A3A4D)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color:
                            selectedIndex == index
                                ? Colors.white
                                : const Color(0xFFB0B0C3),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.title,
                        style: TextStyle(
                          color:
                              selectedIndex == index
                                  ? Colors.white
                                  : const Color(0xFFB0B0C3),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
