import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  final Key? fieldKey;
  final String? label;
  final String? hint;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isDense;
  final bool filled;
  final Color? fillColor;
  final Color? cursorColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  const CustomInputField({
    super.key,
    this.fieldKey,
    this.label,
    this.hint,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.isDense,
    this.filled = false,
    this.fillColor,
    this.cursorColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.borderRadius = 8.0,
    this.borderWidth = 1.0,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();

    // Handle the case where both initialValue and controller are provided
    if (widget.controller != null) {
      _controller = widget.controller!;
      // Set the controller's text to initialValue if provided
      if (widget.initialValue != null && _controller.text.isEmpty) {
        _controller.text = widget.initialValue!;
      }
    } else {
      // Create a new controller with initialValue if no controller was provided
      _controller = TextEditingController(text: widget.initialValue);
    }

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode.dispose();
    }
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus != _hasFocus) {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    }
  }

  InputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(color: color, width: widget.borderWidth),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Default colors based on theme if not explicitly provided
    final defaultEnabledBorderColor = theme.colorScheme.outline;
    final defaultFocusedBorderColor = theme.colorScheme.primary;
    final defaultErrorBorderColor = theme.colorScheme.error;
    final defaultDisabledBorderColor = theme.disabledColor;
    final defaultFillColor = theme.colorScheme.surfaceContainerLowest;
    final defaultCursorColor = theme.colorScheme.primary;

    final textField = TextFormField(
      key: widget.fieldKey,
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization,
      style: widget.textStyle ?? theme.textTheme.bodyLarge,
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      cursorColor: widget.cursorColor ?? defaultCursorColor,
      decoration: InputDecoration(
        // Only use labelText when we're not showing our custom label
        labelText: widget.label != null ? null : widget.label,
        hintText: widget.hint,
        labelStyle: widget.labelStyle,
        hintStyle: widget.hintStyle,
        errorText: widget.errorText,
        errorStyle: widget.errorStyle,
        isDense: widget.isDense,
        filled: widget.filled,
        fillColor: widget.fillColor ?? defaultFillColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: _buildBorder(defaultEnabledBorderColor),
        enabledBorder: _buildBorder(
          widget.enabledBorderColor ?? defaultEnabledBorderColor,
        ),
        focusedBorder: _buildBorder(
          widget.focusedBorderColor ?? defaultFocusedBorderColor,
        ),
        errorBorder: _buildBorder(
          widget.errorBorderColor ?? defaultErrorBorderColor,
        ),
        focusedErrorBorder: _buildBorder(
          widget.errorBorderColor ?? defaultErrorBorderColor,
        ),
        disabledBorder: _buildBorder(
          widget.disabledBorderColor ?? defaultDisabledBorderColor,
        ),
        prefixIconConstraints: widget.prefixIconConstraints,
        suffixIconConstraints: widget.suffixIconConstraints,
      ),
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
    );

    if (widget.label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              widget.label ?? '',
              style:
                  widget.labelStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    color:
                        widget.enabled
                            ? theme.colorScheme.onSurface
                            : theme.disabledColor,
                  ),
            ),
          ),
          textField,
        ],
      );
    }

    return textField;
  }
}
