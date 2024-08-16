import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/common/utility/share_preference.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/appbar/widget.dart';
import 'package:coke_platform/presentation/landing/career/widget.dart';
import 'package:coke_platform/presentation/landing/overview/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about/widget.dart';
import 'overall/widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        SharePreferenceUtitlity.checkIsShowLanguagePopup().then((value) {
          if (!value) {
            DialogUtility.showLanguagePicker(
              context,
              title: S.current.languagePickerLandingPage,
            ).then(
              (value) => SharePreferenceUtitlity.markShowLanguagePopup(),
            );
          }
        });
      },
    );

    super.initState();
  }

  final aboutKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = 1400.w;
    final screenHeight = 900.h;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: ColorConstants.teal,
      body: Stack(
        children: [
          ScrollTransformView(
            children: [
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return const OverviewWidget();
                },
              ),
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return SizedBox(
                    width: 1400.w,
                    height: 1200.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Assets.images.overview.background.image(
                          width: 1400.w,
                          height: 800.w,
                          fit: BoxFit.fitHeight,
                        ),
                        Positioned(
                          left: 100.w,
                          top: 0.w,
                          child: Assets.images.about.about1.image(
                            height: 1200.w,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Positioned(
                          left: 50.w,
                          width: 550.w,
                          child: const AboutWidget(),
                        ),
                      ],
                    ),
                  );
                },
                offsetBuilder: (scrollOffset) {
                  final offscreenPercent = 1 - max(min((scrollOffset - 1200.w) / 1200.w, 1), 0);
                  return Offset(0, -offscreenPercent * 120.h);
                },
              ),
              ScrollTransformItem(
                offsetBuilder: (scrollOffset) {
                  final heightBefore = 900.h + 1150.w;
                  final totalHeight = heightBefore + 900.w + 900.w - 200.w;
                  final startMoving = scrollOffset >= totalHeight;

                  return Offset(
                    0,
                    !startMoving
                        ? scrollOffset > heightBefore
                            ? scrollOffset - heightBefore
                            : 0
                        : totalHeight - heightBefore,
                  );
                },
                builder: (scrollOffset) {
                  return SizedBox(
                    width: double.infinity,
                    height: 900.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Assets.images.essence.background.image(),
                        Column(
                          children: [
                            50.w.wSpace,
                            Text(
                              S.current.essenceTitle,
                              style: textTheme.displaySmall?.copyWith(
                                color: ColorConstants.colorFFF220,
                                fontSize: 48.spMax,
                              ),
                            ),
                            10.w.wSpace,
                            SizedBox(
                              width: 1000.w,
                              child: Text(
                                S.current.essenceContent1,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              ScrollTransformItem(
                offsetBuilder: (scrollOffset) {
                  return Offset(
                    0,
                    -900.w,
                  );
                },
                scaleBuilder: (scrollOffset) {
                  final heightBefore = 900.h + 1150.w + 200.w;
                  double percentage = 0;
                  double width = 1400.w;
                  if (scrollOffset > heightBefore) {
                    percentage = max((heightBefore + 900.w - scrollOffset) / 900.w, 0);
                    width = 1400.w * (1 + 1 - percentage);
                  } else {
                    percentage = 1;
                  }
                  return width / 1400.w;
                },
                builder: (scrollOffset) {
                  final sales = S.current.saleRoleContent.split(';');
                  final others = S.current.otherRoleContent.split(';');
                  final heightBefore = 900.h + 1150.w + 200.w;
                  double percentage = 0;
                  double width = 1400.w;
                  if (scrollOffset > heightBefore) {
                    percentage = max((heightBefore + 900.w - scrollOffset) / 900.w, 0);
                    width = 1400.w * (1 + percentage * 2);
                  } else {
                    percentage = 1;
                  }

                  return Opacity(
                    opacity: percentage * percentage,
                    child: SizedBox(
                      width: width,
                      height: 900.w,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ValueListenableBuilder(
                            valueListenable: LocaleUtility.locale,
                            builder: (context, locale, child) {
                              return locale.languageCode == 'en'
                                  ? Assets.images.essence.en1.image(
                                      width: width,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : Assets.images.essence.vi1.image(
                                      width: width,
                                      fit: BoxFit.fitWidth,
                                    );
                            },
                          ),
                          Column(
                            children: [
                              580.w.hSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  50.w.wSpace,
                                  SizedBox(
                                    width: 500.w,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        sales.length,
                                        (index) {
                                          final sale = sales[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(top: 2.spMax),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: Colors.white,
                                                    size: 10.spMax,
                                                  ),
                                                ),
                                                16.wSpace,
                                                Expanded(
                                                  child: Text(
                                                    sale,
                                                    style: textTheme.bodyLarge?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 16.spMax,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 500.w,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                        others.length,
                                        (index) {
                                          final other = others[index];
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(top: 2.spMax),
                                                  child: Icon(
                                                    Icons.circle,
                                                    color: Colors.white,
                                                    size: 10.spMax,
                                                  ),
                                                ),
                                                16.wSpace,
                                                Expanded(
                                                  child: Text(
                                                    other,
                                                    style: textTheme.bodyLarge?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 16.spMax,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  50.w.wSpace,
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return Assets.images.essence.model.image(
                    width: 745.w,
                  );
                },
                offsetBuilder: (scrollOffset) {
                  final heightBefore = 900.h + 1200.w;
                  final totalHeight = heightBefore + 900.w + 900.w - 250.w;
                  final startMoving = scrollOffset >= totalHeight;
                  return Offset(
                    -80.w,
                    !startMoving
                        ? scrollOffset > heightBefore
                            ? scrollOffset - heightBefore - 900.w - 750.w
                            : -900.w - 750.w
                        : totalHeight - heightBefore - 900.w - 750.w,
                  );
                },
              ),
              ScrollTransformItem(
                offsetBuilder: (scrollOffset) {
                  return Offset(0, -850.w);
                },
                scaleBuilder: (scrollOffset) {
                  final heightBefore = 900.h + 1200.w;
                  final totalHeight = heightBefore + 900.w + 900.w - 250.w;
                  double percentage = 0;
                  if (scrollOffset > (totalHeight - 900.w)) {
                    percentage = max(1 + (totalHeight - scrollOffset) / 900.w, 1);
                  }
                  return percentage;
                },
                builder: (scrollOffset) {
                  final heightBefore = 900.h + 1200.w;
                  final totalHeight = heightBefore + 900.w + 900.w - 250.w;
                  double percentage = 0;
                  if (scrollOffset > (totalHeight - 900.w)) {
                    percentage = min(max((scrollOffset + 900.w - totalHeight) / 900.w, 0), 1);
                  }
                  return Opacity(
                    opacity: percentage,
                    child: Assets.images.essence.en2.image(
                      width: 1400.w,
                      height: 900.w,
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
              ),
              ScrollTransformItem(
                logOffset: true,
                builder: (scrollOffset) {
                  return const CareerWidget();
                },
                offsetBuilder: (scrollOffset) {
                  final heightBefore = 900.h + 1200.w + 900.w * 2 + 745.w;
                  final totalHeight = heightBefore + 780.w;
                  final percentage = max(min((totalHeight - scrollOffset) / 780.w, 1), 0);
                  return Offset(0, -780.w * percentage);
                },
              )
            ],
          ),
          const Positioned(
            child: LandingPageAppbar(),
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: ColorConstants.teal,
      body: Stack(
        children: [
          ScrollTransformView(
            children: [
              ScrollTransformItem(
                builder: (scrollOffset) {
                  final offScreenPercentage = min(scrollOffset / 900.h, 1.0);
                  final width = screenWidth + (screenWidth * 0.2 * offScreenPercentage);
                  final height = screenHeight - (screenHeight * 0.2 * offScreenPercentage);
                  return Opacity(
                    opacity: 1 - offScreenPercentage,
                    child: LadingOverallWidget(
                      width: width,
                      height: height,
                    ),
                  );
                },
                offsetBuilder: (scrollOffset) {
                  final offScreenPercentage = min(scrollOffset / 900.h, 1.0);
                  final heightShrinkAmount = 900.h * 0.2 * offScreenPercentage;
                  final bool startMoving = scrollOffset >= 900.h;
                  final onScreenOffset = scrollOffset + heightShrinkAmount / 3;
                  return Offset(
                    0,
                    !startMoving ? onScreenOffset : (onScreenOffset - (scrollOffset - 900.h * 0.5)),
                  );
                },
              ),
              ScrollTransformItem(
                offsetBuilder: (scrollOffset) => Offset(
                  0,
                  -900.h,
                ),
                builder: (context) {
                  return SizedBox(
                    width: 1400.w,
                    height: 900.h,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Assets.images.cokeFresh.image(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 24),
                                      child: Assets.images.fizzUp.image(),
                                    ),
                                    40.h.hSpace,
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Assets.images.model.image(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // ScrollTransformItem(
              //   builder: (scrollOffset) {
              //     return Assets.images.about.background.image(
              //       width: 1400.w,
              //       height: 900.h,
              //       fit: BoxFit.cover,
              //     );
              //   },
              //   offsetBuilder: (scrollOffset) {
              //     return Offset(
              //       0,
              //       -900.h,
              //     );
              //   },
              // ),
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return Container(
                    width: 1400.w,
                    height: 900.h,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        40.w.wSpace,
                        SizedBox(
                          width: 500.w,
                          child: const AboutWidget(),
                        ),
                      ],
                    ),
                  );
                },
                offsetBuilder: (scrollOffset) {
                  return Offset(
                    0,
                    -1800.h,
                  );
                },
              ),
              // ScrollTransformItem(
              //   logOffset: true,
              //   builder: (scrollOffset) {
              //     final theme = Theme.of(context);
              //     final textTheme = theme.textTheme;

              //     return Container(
              //       width: screenWidth,
              //       color: ColorConstants.color3F6DB8,
              //       alignment: Alignment.center,
              //       padding: EdgeInsets.symmetric(
              //         horizontal: 100.w,
              //         vertical: 50.h,
              //       ),
              //       child: Stack(
              //         children: [
              //           Align(alignment: Alignment.center,),
              //           Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Text(
              //                 S.current.essenceTitle,
              //                 style: textTheme.displayMedium?.copyWith(
              //                   color: Colors.white,
              //                 ),
              //               ),
              //               20.h.hSpace,
              //               Text(
              //                 S.current.essenceContent1,
              //                 style: textTheme.bodyLarge?.copyWith(
              //                   color: Colors.white,
              //                 ),
              //                 textAlign: TextAlign.center,
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              //   offsetBuilder: (scrollOffset) {
              //     final box = aboutKey.currentContext?.findRenderObject() as RenderBox?;
              //     final height = box?.size.height ?? 400.h;

              //     return Offset(
              //       0,
              //       -height * 2,
              //     );
              //   },
              // )
            ],
          ),
          const Positioned(
            child: LandingPageAppbar(),
          ),
        ],
      ),
    );
  }
}
