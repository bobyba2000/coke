import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../appbar/widget.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 900.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.overview.background.image(
            height: 900.h,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Assets.images.overview.overview1.image(
              width: 900.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: SizedBox.shrink(),
              ),
              50.w.wSpace,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.images.overview.title.image(
                      width: 550.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Assets.images.overview.tagLine.image(
                        width: 550.w,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 0,
            height: 80,
            left: 0,
            right: 0,
            child: LandingPageAppbar(
              showLogo: true,
            ),
          ),
        ],
      ),
    );
  }
}
