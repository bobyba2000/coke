import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/admin/sidebar/item.dart';
import 'package:flutter/material.dart';

class AdminSidebarWidget extends StatefulWidget {
  const AdminSidebarWidget({super.key});

  @override
  State<AdminSidebarWidget> createState() => _AdminSidebarWidgetState();
}

class _AdminSidebarWidgetState extends State<AdminSidebarWidget> {
  @override
  Widget build(BuildContext context) {
    final items = [
      SidebarItemModel(
        title: S.current.dashboard,
        icon: Icons.dashboard,
        path: './',
      ),
    ];
    return Container(
      width: 280,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(17, 12, 46, 0.15),
            offset: Offset(0, 48),
            blurRadius: 100,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return SidebarItemWidget(
            item: item,
            isCurrent: index == 0,
          );
        },
        separatorBuilder: (context, index) => 12.hSpace,
        itemCount: items.length,
      ),
    );
  }
}
