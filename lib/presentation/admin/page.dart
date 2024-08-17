import 'package:coke_platform/presentation/admin/appbar/widget.dart';
import 'package:coke_platform/presentation/admin/page/dashboard/page.dart';
import 'package:coke_platform/presentation/admin/sidebar/widget.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  final String? contestantKey;
  const AdminPage({super.key, this.contestantKey});

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Theme.of(context).colorScheme.primary,
      title: 'Admin',
      child: Scaffold(
        body: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AdminSidebarWidget(),
                  Expanded(
                    child: DashboardPage(
                      contestantKey: contestantKey,
                    ),
                  ),
                ],
              ),
            ),
            const AdminAppbarWidget(),
          ],
        ),
      ),
    );
  }
}
