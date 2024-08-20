import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/overall/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                    150.h.hSpace,
                    Text(
                      S.current.processTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.h.hSpace,
                    Text(
                      S.current.processContent,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 22.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.h.hSpace,
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 800.w,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        top: 50.h,
                        left: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'By 10th Sep',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            16.hSpace,
                            WaterBubble(
                              size: 100.w,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Online\nApplication',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            16.hSpace,
                            Text(
                              '3 weeks',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFfed602),
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 50.h + 80.w,
                        left: 120.w,
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
                        top: 102.h,
                        left: 150.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            WaterBubble(
                              size: 120.w,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Online\nAssessment',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            16.hSpace,
                            Text(
                              '3 days',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFfed602),
                                fontSize: 16.sp,
                              ),
                            ),
                            6.hSpace,
                            Text(
                              '(after the\nassignment assigned)',
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
                        top: 102.w + 60.w,
                        left: 150.w + 160.w,
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
                        top: 72.h,
                        left: 350.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '18th Sep - 21st Sep',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            16.hSpace,
                            WaterBubble(
                              size: 130.w,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Launchpad\nday',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            16.hSpace,
                            Text(
                              '1-3 days',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFfed602),
                                fontSize: 16.sp,
                              ),
                            ),
                            6.hSpace,
                            Text(
                              '(depending on function)',
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
                        top: 100.w,
                        left: 500.w,
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
                        left: 550.w,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '30th Sep',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                              ),
                            ),
                            16.hSpace,
                            WaterBubble(
                              size: 150.w,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'Onboarding',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            16.hSpace,
                            Text(
                              '10 days',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFfed602),
                                fontSize: 16.sp,
                              ),
                            ),
                            6.hSpace,
                            Text(
                              '(after the\nafter acceptance)',
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
