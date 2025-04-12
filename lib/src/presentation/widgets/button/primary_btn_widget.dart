import 'package:flutter/material.dart';
import 'package:uih/uih.dart';

class PrimaryBtnWidget extends StatelessWidget {
  const PrimaryBtnWidget({
    super.key,
    this.onPressed,
    this.label,
    this.icon,
    this.margin,
    this.isLoading = false,
    this.isDisabled = false,
  });
  final VoidCallback? onPressed;
  final String? label;
  final Widget? icon;
  final EdgeInsetsGeometry? margin;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child:
          icon != null
              ? ElevatedButton.icon(
                onPressed: (isLoading || isDisabled) ? null : onPressed,
                icon:
                    isLoading
                        ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: context.colorScheme.onPrimary,
                          ),
                        )
                        : icon!,
                label: Text(
                  label ?? '',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
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
                onPressed: (isLoading || isDisabled) ? null : onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colorScheme.primary,
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
                child:
                    isLoading
                        ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: context.colorScheme.onPrimary,
                          ),
                        )
                        : Text(
                          label ?? '',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
              ),
    );
  }
}
