import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  const CustomFilledButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isHover ? widget.color?.withOpacity(0.7) ?? const Color.fromARGB(255, 85, 2, 20) : widget.color ?? const Color(0xFFFE0138);
    const foreground = Colors.white;
    bool isMobile = 1400.w < 500;
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() {
        isHover = value;
      }),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 10.wMax : 14.wMin,
          horizontal: isMobile ? 16.wMax : 40.wMin,
        ),
        duration: const Duration(milliseconds: 200),
        child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: foreground,
            fontSize: isMobile ? 14.spMax : 18.spMin,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const CustomTextButton({super.key, required this.title, required this.onTap});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = isHover ? const Color(0xFFFE0138) : Colors.transparent;
    final foreground = isHover ? Colors.white : const Color(0xFF4E5156);
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) => setState(() {
        isHover = value;
      }),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        padding: EdgeInsets.symmetric(vertical: 14.wMin, horizontal: 40.wMin),
        duration: const Duration(milliseconds: 200),
        child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: foreground,
            fontSize: 18.spMin,
          ),
        ),
      ),
    );
  }
}
