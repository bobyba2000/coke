import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              height: 900.h,
              fit: BoxFit.fitHeight,
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.cokeFresh.image(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Assets.images.fizzUp.image(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
