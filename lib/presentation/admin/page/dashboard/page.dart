import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/presentation/admin/page/dashboard/widget/overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/cv_list/widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.hSpace,
            SizedBox(
              width: 330.w,
              child: const OverviewWidget(totalCVs: 400),
            ),
            16.hSpace,
            const CVListWidget(),
          ],
        ),
      ),
    );
  }
}
