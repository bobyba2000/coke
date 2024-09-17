import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/overall/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = LocaleUtility.locale.value.languageCode;
    final isEnglish = languageCode == 'en';
    return SizedBox(
      height: 800.w,
      width: 1400.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              SizedBox(
                width: 700.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    200.w.hSpace,
                    Text(
                      S.current.processTitle.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 38.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.h.hSpace,
                    Text(
                      S.current.processContent,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.sp,
                        height: 1.3.wMax,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.h.hSpace,
                  ],
                ),
              ),
              50.w.hSpace,
              Expanded(
                child: SizedBox(
                  width: 900.w,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 0.w,
                        left: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            WaterBubble(
                              size: 100.w,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Text(
                                  S.current.onlineApplication,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14.spMin,
                                    height: 1.3.wMax,
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
                                fontSize: 16.sp,
                              ),
                            ),
                            6.w.hSpace,
                            isEnglish
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '(By 16',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: const Color(0xFFfed602),
                                            ),
                                          ),
                                          Text(
                                            'th',
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              color: const Color(0xFFfed602),
                                            ),
                                          ),
                                          Text(
                                            ' Sep for Non-Sales',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: const Color(0xFFfed602),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'By 23',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: const Color(0xFFfed602),
                                            ),
                                          ),
                                          Text(
                                            'rd',
                                            style: TextStyle(
                                              fontSize: 8.sp,
                                              color: const Color(0xFFfed602),
                                            ),
                                          ),
                                          Text(
                                            ' Sep for Sales)',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: const Color(0xFFfed602),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Text(
                                    S.current.by16Sep,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: const Color(0xFFfed602),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10.w + 90.w,
                        left: 150.w,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(
                                  0.2,
                                ),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Transform.rotate(
                            angle: pi / 5,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 92.w,
                        left: 220.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            WaterBubble(
                              size: 120.w,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Text(
                                  S.current.onlineAssessment,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14.spMin,
                                    height: 1.3.wMax,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            16.w.hSpace,
                            Text(
                              S.current.in3Days,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFfed602),
                                fontSize: 16.sp,
                              ),
                            ),
                            6.w.hSpace,
                            Text(
                              S.current.afterAssignment,
                              style: TextStyle(
                                color: const Color(0xFFfed602),
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 92.w + 60.w,
                        left: 220.w + 160.w,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(
                                  0.2,
                                ),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Transform.rotate(
                            angle: pi / 10,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.w,
                        left: 420.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            32.w.hSpace,
                            WaterBubble(
                              size: 130.w,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Text(
                                  S.current.launchPadDay,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.spMin,
                                    height: 1.3.wMax,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            16.w.hSpace,
                            Text(
                              S.current.in1to3,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFfed602),
                                fontSize: 16.sp,
                              ),
                            ),
                            6.w.hSpace,
                            Text(
                              S.current.dependOnFunction,
                              style: TextStyle(
                                color: const Color(0xFFfed602),
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 90.w,
                        left: 570.w,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(
                                  0.2,
                                ),
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Transform.rotate(
                            angle: -pi / 5,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 24.w,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.h,
                        left: 620.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            WaterBubble(
                              size: 150.w,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Text(
                                  S.current.onboarding,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.spMin,
                                    height: 1.3.wMax,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            16.w.hSpace,
                            Text(
                              S.current.in10Days,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFfed602),
                                fontSize: 16.sp,
                              ),
                            ),
                            6.w.hSpace,
                            Text(
                              S.current.afterAcceptance,
                              style: TextStyle(
                                color: const Color(0xFFfed602),
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          100.w.wSpace,
        ],
      ),
    );
  }
}
