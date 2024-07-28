import 'package:flutter/material.dart';

class AppDropDownWidget<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final String? hintText;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final String? label;
  final TextStyle? labelStyle;
  final Color? filledColor;
  final bool? filled;
  final Color? iconColor;
  final bool? required;
  final Widget? leftLabel;
  final InputBorder? inputBorder;
  final double? borderRadius;
  final bool outline;
  final TextAlign? textAlign;
  final bool isNeedToReset;
  final String? helperText;

  const AppDropDownWidget({
    Key? key,
    required this.items,
    this.value,
    this.hintText,
    this.onChanged,
    this.label,
    this.labelStyle,
    this.filledColor,
    this.filled,
    this.iconColor,
    this.outline = false,
    this.required = false,
    this.validator,
    this.leftLabel,
    this.inputBorder,
    this.borderRadius,
    this.textAlign = TextAlign.right,
    this.isNeedToReset = false,
    this.helperText,
  }) : super(key: key);

  @override
  State<AppDropDownWidget<T>> createState() => _AppDropDownWidgetState<T>();
}

class _AppDropDownWidgetState<T> extends State<AppDropDownWidget<T>> {
  bool isLoading = false;
  @override
  void didUpdateWidget(covariant AppDropDownWidget<T> oldWidget) {
    if (widget.value != oldWidget.value || widget.items != oldWidget.items) {
      checkValue();
    }
    super.didUpdateWidget(oldWidget);
  }

  void checkValue() {
    setState(() {
      if (widget.isNeedToReset) {
        isLoading = true;
      }
    });
    Future.delayed(Duration(milliseconds: widget.isNeedToReset ? 200 : 0)).then(
      (value) {
        isLoading = false;
        for (var item in widget.items) {
          if (item.value == widget.value) {
            value = item.value;
            if (mounted) {
              setState(() {});
            }
            return;
          }
        }
        setState(() {
          value = null;
        });
      },
    );
  }

  @override
  void initState() {
    checkValue();
    super.initState();
  }

  T? value;

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
                    style: widget.labelStyle ?? Theme.of(context).textTheme.bodyMedium,
                  ),
                  Visibility(
                    visible: widget.required!,
                    child: Text(
                      "*",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          ),
                    ),
                  ),
                  const Spacer(),
                  widget.leftLabel ?? const SizedBox(),
                ],
              ),
            )),
        if (!isLoading)
          DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              isDense: true,
              value: value,
              isExpanded: true,
              onChanged: widget.onChanged,
              validator: widget.validator,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              decoration: InputDecoration(
                helperText: widget.helperText,
                border: widget.inputBorder ?? (widget.outline ? const OutlineInputBorder() : null),
                focusedBorder: widget.inputBorder ?? (widget.outline ? const OutlineInputBorder() : null),
                enabledBorder: widget.inputBorder ?? (widget.outline ? const OutlineInputBorder() : null),
                disabledBorder: widget.inputBorder ?? (widget.outline ? const OutlineInputBorder() : null),
                filled: widget.filled,
                alignLabelWithHint: true,
                fillColor: widget.filledColor,
                isDense: true,
                hintText: widget.hintText,
                contentPadding: const EdgeInsets.all(15),
              ),
              items: widget.items,
            ),
          ),
      ],
    );
  }
}
