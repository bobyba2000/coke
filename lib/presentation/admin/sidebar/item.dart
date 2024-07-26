import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidebarItemModel {
  final String title;
  final IconData icon;
  final String path;

  SidebarItemModel({
    required this.title,
    required this.icon,
    required this.path,
  });
}

class SidebarItemWidget extends StatefulWidget {
  final SidebarItemModel item;
  final bool isCurrent;
  const SidebarItemWidget({
    super.key,
    required this.item,
    required this.isCurrent,
  });

  @override
  State<SidebarItemWidget> createState() => _SidebarItemWidgetState();
}

class _SidebarItemWidgetState extends State<SidebarItemWidget> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isActive = isHover || widget.isCurrent;
    final background = isActive ? colorScheme.primary.withOpacity(0.7) : null;
    final foreground =
        isActive ? colorScheme.onPrimary : const Color(0xFF6c757d);
    return InkWell(
      onTap: () {},
      onHover: (value) {
        isHover = value;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(6.r),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Icon(
              widget.item.icon,
              color: foreground,
            ),
            12.wSpace,
            Text(
              widget.item.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: foreground,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
