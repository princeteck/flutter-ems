import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uih/uih.dart';
import '../../../../data/models/bottom_navbar/bottom_navbar_item_model.dart';

class BottomNavbarSection extends StatelessWidget {
  const BottomNavbarSection({
    super.key,
    this.onTap,
    required this.selectedIndex,
    required this.items,
  });
  final ValueChanged<int>? onTap;
  final int selectedIndex;
  final List<BottomNavbarItemModel> items;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: kBottomNavigationBarHeight + 8,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                items.map((item) {
                  return GestureDetector(
                    onTap:
                        item.onTap != null
                            ? () {
                              item.onTap!();
                            }
                            : () {
                              onTap?.call(items.indexOf(item));
                            },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        // color:
                        //     selectedIndex == item.index
                        //         ? const Color(0xFF3A3A4D)
                        //         : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (item.icon != null)
                            SvgPicture.asset(
                              item.icon ?? '',
                              colorFilter: ColorFilter.mode(
                                selectedIndex == item.index
                                    ? context.colorScheme.primary
                                    : context.colorScheme.onSurfaceVariant,
                                BlendMode.srcIn,
                              ),
                            ),
                          const SizedBox(height: 8),
                          if (item.title != null)
                            Text(
                              item.title ?? '',
                              style: context.theme.textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        selectedIndex == item.index
                                            ? context.colorScheme.primary
                                            : context
                                                .colorScheme
                                                .onSurfaceVariant,
                                  ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
