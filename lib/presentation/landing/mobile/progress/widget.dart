import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/overall/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileProgressWidget extends StatelessWidget {
  const MobileProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = LocaleUtility.locale.value.languageCode;
    final isEnglish = languageCode == 'en';
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
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          12.hSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              S.current.processContent,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10,
                height: 1.3,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          8.hSpace,
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1100.w - 340 < 0 ? 340 - 1100.w : 1100.w - 340),
                child: Assets.images.progress.backgroundMobile.image(
                  width: 1400.w,
                ),
              ),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  SizedBox(
                    height: 340,
                    width: 1000.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          right: 34,
                          top: 0,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              WaterBubble(
                                size: 56,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    S.current.onlineApplication,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 8,
                                      height: 1.3,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              8.wSpace,
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.current.in3weeks,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFfed602),
                                      fontSize: 10,
                                    ),
                                  ),
                                  isEnglish
                                      ? const Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '(By 16',
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xFFfed602),
                                              ),
                                            ),
                                            Text(
                                              'th',
                                              style: TextStyle(
                                                fontSize: 4,
                                                color: Color(0xFFfed602),
                                              ),
                                            ),
                                            Text(
                                              ' Sep)',
                                              style: TextStyle(
                                                fontSize: 8,
                                                color: Color(0xFFfed602),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Text(
                                          S.current.by16Sep,
                                          style: const TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFFfed602),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 35,
                          top: 56,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              WaterBubble(
                                size: 70,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Text(
                                    S.current.onlineAssessment,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 10,
                                      height: 1.3.wMax,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              8.wSpace,
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.current.in3Days,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFfed602),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    S.current.afterAssignment,
                                    style: const TextStyle(color: Color(0xFFfed602), fontSize: 8),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 140,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              WaterBubble(
                                size: 80,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Text(
                                    S.current.launchPadDay,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 11,
                                      height: 1.3.wMax,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              8.wSpace,
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.current.in1to3,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFfed602),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    S.current.dependOnFunction,
                                    style: const TextStyle(color: Color(0xFFfed602), fontSize: 8),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 230,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              WaterBubble(
                                size: 90,
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Text(
                                    S.current.onboarding,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 11,
                                      height: 1.3.wMax,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              8.wSpace,
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    S.current.in10Days,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFfed602),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    S.current.afterAcceptance,
                                    style: const TextStyle(color: Color(0xFFfed602), fontSize: 8),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 1616.w,
                  //   width: 1000.w,
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Expanded(
                  //             child: Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 isEnglish
                  //                     ? const Row(
                  //                         mainAxisSize: MainAxisSize.min,
                  //                         crossAxisAlignment: CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             '(By 16',
                  //                             style: TextStyle(
                  //                               fontSize: 10,
                  //                               color: Color(0xFFfed602),
                  //                             ),
                  //                           ),
                  //                           Text(
                  //                             'th',
                  //                             style: TextStyle(
                  //                               fontSize: 6,
                  //                               color: Color(0xFFfed602),
                  //                             ),
                  //                           ),
                  //                           Text(
                  //                             ' Sep)',
                  //                             style: TextStyle(
                  //                               fontSize: 10,
                  //                               color: Color(0xFFfed602),
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       )
                  //                     : Text(
                  //                         S.current.by16Sep,
                  //                         style: const TextStyle(
                  //                           fontSize: 10,
                  //                           color: Color(0xFFfed602),
                  //                         ),
                  //                       ),
                  //                 4.hSpace,
                  //                 WaterBubble(
                  //                   size: 72,
                  //                   color: Colors.white,
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.all(2),
                  //                     child: Text(
                  //                       S.current.onlineApplication,
                  //                       style: const TextStyle(
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                         fontSize: 10,
                  //                         height: 1.3,
                  //                       ),
                  //                       textAlign: TextAlign.center,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 4.hSpace,
                  //                 Text(
                  //                   S.current.in3weeks,
                  //                   style: const TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Color(0xFFfed602),
                  //                     fontSize: 10,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.white.withOpacity(
                  //                     0.2,
                  //                   ),
                  //                   blurRadius: 4,
                  //                   spreadRadius: 2,
                  //                 ),
                  //               ],
                  //             ),
                  //             child: const Icon(
                  //               Icons.arrow_forward_ios,
                  //               color: Colors.white,
                  //               size: 16,
                  //             ),
                  //           ),
                  //           Expanded(
                  //               child: Column(
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               18.hSpace,

                  //               4.hSpace,

                  //             ],
                  //           ))
                  //         ],
                  //       ),
                  //       8.hSpace,
                  //       Align(
                  //         alignment: Alignment.centerRight,
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(right: 64),
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.white.withOpacity(
                  //                     0.2,
                  //                   ),
                  //                   blurRadius: 4,
                  //                   spreadRadius: 2,
                  //                 ),
                  //               ],
                  //             ),
                  //             child: Transform.rotate(
                  //               angle: pi / 2,
                  //               child: const Icon(
                  //                 Icons.arrow_forward_ios,
                  //                 color: Colors.white,
                  //                 size: 16,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       8.hSpace,
                  //       Row(
                  //         children: [
                  //           Expanded(
                  //             child: Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 WaterBubble(
                  //                   size: 72,
                  //                   color: Colors.white,
                  //                   child: Padding(
                  //                     padding: EdgeInsets.all(8.w),
                  //                     child: Text(
                  //                       S.current.onboarding,
                  //                       style: TextStyle(
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                         fontSize: 10,
                  //                         height: 1.3.wMax,
                  //                       ),
                  //                       textAlign: TextAlign.center,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 4.hSpace,
                  //                 Text(
                  //                   S.current.in10Days,
                  //                   style: const TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Color(0xFFfed602),
                  //                     fontSize: 10,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(20),
                  //               boxShadow: [
                  //                 BoxShadow(
                  //                   color: Colors.white.withOpacity(
                  //                     0.2,
                  //                   ),
                  //                   blurRadius: 4,
                  //                   spreadRadius: 2,
                  //                 ),
                  //               ],
                  //             ),
                  //             child: const Icon(
                  //               Icons.arrow_back_ios,
                  //               color: Colors.white,
                  //               size: 16,
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Column(
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 WaterBubble(
                  //                   size: 72,
                  //                   color: Colors.white,
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.all(2),
                  //                     child: Text(
                  //                       S.current.launchPadDay,
                  //                       style: const TextStyle(
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.white,
                  //                         fontSize: 10,
                  //                         height: 1.3,
                  //                       ),
                  //                       textAlign: TextAlign.center,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 4.hSpace,
                  //                 Text(
                  //                   S.current.in1to3,
                  //                   style: const TextStyle(
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Color(0xFFfed602),
                  //                     fontSize: 10,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
