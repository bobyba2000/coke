import 'package:coke_platform/constants/color.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final bool enabled;
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.enabled = true,
    this.color,
  });

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final background = widget.enabled && isHover ? widget.color ?? ColorConstants.teal : colorScheme.onPrimary;
    final foreground = widget.enabled && isHover
        ? colorScheme.onPrimary
        : widget.enabled
            ? widget.color ?? ColorConstants.teal
            : Colors.grey;
    final border = widget.enabled && isHover
        ? null
        : Border.all(
            color: widget.enabled ? widget.color ?? ColorConstants.teal : Colors.grey,
          );
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        isHover = value;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          border: border,
          color: background,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        child: Text(
          widget.title,
          style: theme.textTheme.displaySmall?.copyWith(color: foreground),
        ),
      ),
    );
  }
}
