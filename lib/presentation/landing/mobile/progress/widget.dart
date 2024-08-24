import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/overall/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileProgressWidget extends StatelessWidget {
  const MobileProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF9833ff),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.hSpace,
          Text(
            S.current.processTitle.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          8.hSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.current.processContent,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                height: 1.3,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Stack(
            children: [
              Assets.images.progress.background.image(
                width: 1400.w,
              ),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  SizedBox(
                    width: 800.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.current.by10Sep,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  16.hSpace,
                                  WaterBubble(
                                    size: 80,
                                    color: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Text(
                                        S.current.onlineApplication,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 12,
                                          height: 1.3,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  16.hSpace,
                                  Text(
                                    S.current.in3weeks,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFfed602),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                WaterBubble(
                                  size: 85,
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.w),
                                    child: Text(
                                      S.current.onlineAssessment,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12,
                                        height: 1.3.wMax,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                16.hSpace,
                                Text(
                                  S.current.in3Days,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFfed602),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      // child: Assets.images.progress.,
    );
  }
}
