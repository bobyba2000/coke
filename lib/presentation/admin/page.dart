import 'package:coke_platform/presentation/admin/appbar/widget.dart';
import 'package:coke_platform/presentation/admin/page/dashboard/page.dart';
import 'package:coke_platform/presentation/admin/sidebar/widget.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 60),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdminSidebarWidget(),
                Expanded(
                  child: DashboardPage(),
                ),
              ],
            ),
          ),
          const AdminAppbarWidget(),
        ],
      ),
    );
  }
}
