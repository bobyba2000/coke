import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationAppbar extends StatelessWidget {
  const ApplicationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 30.w,
        top: 16.h,
        bottom: 16.h,
        right: 30.w,
      ),
      child: Row(
        children: [
          Assets.images.logo.image(
            width: 160,
          ),
          const Spacer(),
          const LanguageSwitch(
            needToRefresh: true,
          ),
        ],
      ),
    );
  }
}
