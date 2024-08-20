import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? inputController;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final String? label;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final bool? autoFocus;
  final bool? filled;
  final Color? fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool required;
  final Widget? leftLabel;
  final TextStyle? textStyle;
  final String? initText;
  final InputBorder? border;
  final TextAlign? textAlign;
  final bool? enabled;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool isAutoSelectAll;
  final Color? cursorColor;
  final TextStyle? hintStyle;
  final String? helperText;
  final String? aboveHelperText;
  final int? maxLength;
  final int? maxWords;

  const TextFieldWidget({
    super.key,
    this.inputController,
    this.onChanged,
    this.textInputType,
    this.label,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.padding,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.labelStyle,
    this.readOnly = false,
    this.onTap,
    this.required = false,
    this.leftLabel,
    this.textStyle,
    this.border,
    this.initText,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.suffixIcon,
    this.enabled,
    this.maxLines,
    this.autoFocus = false,
    this.isAutoSelectAll = false,
    this.cursorColor,
    this.hintStyle,
    this.helperText,
    this.aboveHelperText,
    this.maxLength,
    this.maxWords,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _obscureText;
  late TextEditingController inputController;
  String text = '';

  int countWords() {
    if (text.trim() == '') {
      return 0;
    }
    final words = text.trim().split(RegExp(r'\s+'));
    return words.length;
  }

  @override
  void initState() {
    _obscureText = widget.obscureText;
    inputController = widget.inputController ?? TextEditingController(text: widget.initText);
    if (widget.isAutoSelectAll && widget.autoFocus!) {
      inputController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: inputController.value.text.length,
      );
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TextFieldWidget oldWidget) {
    if (widget.initText != oldWidget.initText) {
      inputController.text = widget.initText ?? inputController.text;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: widget.label != null,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.label ?? "",
                    style: widget.labelStyle ?? Theme.of(context).textTheme.titleMedium,
                  ),
                  Visibility(
                    visible: widget.required,
                    child: Text(
                      "*",
                      style: (widget.labelStyle ?? Theme.of(context).textTheme.titleMedium)?.copyWith(color: Colors.red),
                    ),
                  ),
                  const Spacer(),
                  widget.leftLabel ?? const SizedBox()
                ],
              ),
            )),
        if (widget.aboveHelperText != null)
          Text(
            widget.aboveHelperText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey,
                ),
          ),
        TextFormField(
          focusNode: widget.focusNode,
          controller: inputController,
          obscureText: _obscureText,
          onFieldSubmitted: widget.onFieldSubmitted,
          readOnly: widget.readOnly,
          cursorColor: widget.cursorColor,
          onTap: () {
            widget.onTap?.call();
            if (widget.isAutoSelectAll) {
              inputController.selection = TextSelection(
                baseOffset: 0,
                extentOffset: inputController.value.text.length,
              );
            }
          },
          style: widget.textStyle,
          textAlign: widget.textAlign ?? TextAlign.start,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines ?? 1,
          enabled: widget.enabled,
          autofocus: widget.autoFocus ?? false,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            helperMaxLines: 4,
            helperText: widget.helperText,
            filled: widget.filled ?? true,
            hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),
            border: widget.border ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorConstants.teal,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
            enabledBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorConstants.teal,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
            focusedBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorConstants.teal,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
            errorBorder: widget.border ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
            fillColor: Colors.white,
            hintText: widget.hintText ?? S.current.pleaseFillIn,
            helperStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),
            contentPadding: widget.padding ??
                EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 4.w,
                ),
            suffixIconConstraints: BoxConstraints(maxHeight: 12.w),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 12.w,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: const Color(0xFF646464),
                      ),
                    ),
                  )
                : widget.suffixIcon,
          ),
          keyboardType: widget.textInputType,
          onChanged: (value) {
            text = value;
            widget.onChanged?.call(text);
            if (widget.maxWords != null) {
              setState(() {});
            }
          },
          validator: widget.validator,
        ),
        if (widget.maxWords != null)
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${countWords()}/${widget.maxWords}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
      ],
    );
  }
}
