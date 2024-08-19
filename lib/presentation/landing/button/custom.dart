import 'package:flutter/material.dart';

class CustomFilledButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const CustomFilledButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isHover ? const Color.fromARGB(255, 211, 2, 47) : const Color(0xFFFE0138);
    const foreground = Colors.white;
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
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
        duration: const Duration(milliseconds: 200),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: foreground,
            fontSize: 18,
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
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
        duration: const Duration(milliseconds: 200),
        child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: foreground,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
