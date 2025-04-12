import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

class SecondBtnWidget extends StatelessWidget {
  const SecondBtnWidget({
    super.key,
    this.onPressed,
    this.label,
    this.icon,
    this.margin,
  });
  final VoidCallback? onPressed;
  final String? label;
  final Widget? icon;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child:
          icon == null
              ? ElevatedButton.icon(
                onPressed: onPressed,
                label: Text(
                  label ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
              )
              : ElevatedButton(
                onPressed: onPressed,
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
                  label ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
    );
  }
}
