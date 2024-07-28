import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onTap,
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
    final background = isHover ? colorScheme.primary : colorScheme.onPrimary;
    final foreground = isHover ? colorScheme.onPrimary : colorScheme.primary;
    final border = isHover ? null : Border.all(color: colorScheme.primary);
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
