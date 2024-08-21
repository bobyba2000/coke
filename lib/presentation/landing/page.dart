import 'dart:async';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/share_preference.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/about/widget.dart';
import 'package:coke_platform/presentation/landing/career/widget.dart';
import 'package:coke_platform/presentation/landing/essence/widget.dart';
import 'package:coke_platform/presentation/landing/footer/widget.dart';
import 'package:coke_platform/presentation/landing/overview/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'countdown/widget.dart';
import 'journey/widget.dart';
import 'page1.dart';
import 'progress/widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _background = ScrollController();
  final ScrollController _page = ScrollController();
  bool isScrolling = false;
  late Timer timer;
  num previousPosition = 0;
  int page = 0;
  bool isScrollbarHover = false;

  // final journey1Key = GlobalKey();
  final footerKey = GlobalKey();

  @override
  void initState() {
    _page.addListener(() {
      if (1400.w * 1.5 < 900.h) {
        _background.jumpTo(_page.offset);
      } else {
        if (_page.offset < 1600.w) {
          _background.jumpTo(_page.offset);
        } else if (_page.offset > 2400.w) {
          _background.jumpTo(_page.offset - 800.w);
        }
      }
    });

    // Future.delayed(
    //   const Duration(milliseconds: 200),
    //   () {
    //     timer = Timer.periodic(
    //       const Duration(milliseconds: 200),
    //       (timer) {
    //         final pixels = _page.position.pixels;

    //         if (pixels != previousPosition && !isScrolling) {
    //           _onStartScroll();
    //         }
    //         if (pixels == previousPosition && isScrolling) {
    //           _onEndScroll();
    //         }
    //         previousPosition = pixels;
    //       },
    //     );
    //   },
    // );

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

  // void _onStartScroll() {
  //   isScrolling = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  // void _onEndScroll() {
  //   isScrolling = false;

  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Coke Fresh 2024',
      color: Colors.black,
      child: SelectionArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                controller: _background,
                child: Column(
                  children: [
                    Container(
                      color: const Color(0xFF3f6db8),
                      height: 1700.w,
                      width: 1400.w,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Assets.images.landingPageBackground.image(
                            height: 1700.w,
                            width: 1400.w,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            bottom: 400.h,
                            left: 90.w,
                            child: ZoomIn(
                              globalKey: GlobalKey(),
                              child: Assets.images.about.background.image(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 1400.w,
                      color: const Color(0xFF3f6db8),
                      height: 1400.w * 1.5 < 900.h ? 1700.w : 800.w,
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 100.w,
                            left: 0,
                            right: 0,
                            child: Container(
                              color: const Color(0xFF3f6db8),
                              height: 1400.w * 1.5 < 900.h ? 1600.w : 700.w,
                              width: double.infinity,
                              child: Assets.images.essence.background.image(
                                height: 1400.w * 1.5 < 900.h ? 1600.w : 700.w,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 300.w,
                            top: 1400.w * 1.5 < 900.h ? 900.w : 100.w,
                            child: Assets.images.essence.model.image(
                              width: 600.w,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            height: 120.w,
                            child: Container(
                              color: const Color(0xFF3f6db8),
                              height: 120.w,
                              width: 1400.w,
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        color: const Color(0xFF3f6db8),
                                        height: 10,
                                        width: 1400.w,
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: const Color(0xFFf1feff),
                                          width: 1400.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Assets.images.essence.bottom.image(
                                    width: 1400.w,
                                    height: 120.w,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 300.w,
                            right: 300.w,
                            top: 0.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  S.current.essenceTitle.toUpperCase(),
                                  style: TextStyle(
                                    color: ColorConstants.colorFFF220,
                                    fontSize: 45.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  S.current.essenceContent1,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    100.w.hSpace,
                    Container(
                      height: 700.w,
                      width: 1400.w,
                      color: const Color(0xFFf1feff),
                    ),
                    Container(
                      height: 1500.w,
                      width: 1400.w,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 1000.w,
                      width: 1400.w,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 1400.w,
                                height: 10,
                                color: Colors.white,
                              ),
                              Container(
                                width: 1400.w,
                                height: 1000.w - 10,
                                color: const Color(0xFF9833ff),
                              )
                            ],
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            height: 100.w,
                            width: 1400.w,
                            child: Assets.images.progress.transition.image(
                              fit: BoxFit.fill,
                            ),
                          ),
                          Assets.images.progress.background.image(
                            width: 1400.w,
                            height: 1000.w,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 900.w,
                      width: 1400.w,
                      color: const Color(0xFF31cccc),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Assets.images.countdown.background.image(),
                          Positioned(
                            bottom: 0,
                            width: 1400.w,
                            height: 100.h,
                            left: 0,
                            child: Assets.images.progress.bottom.image(
                              width: 1400.w,
                              height: 100.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (footerKey.currentContext != null) {
                          final box = footerKey.currentContext!.findRenderObject() as RenderBox;
                          return SizedBox(
                            width: 1400.w,
                            height: box.size.height,
                          );
                        }
                        return SizedBox(
                          width: 1400.w,
                          height: 450.w,
                        );
                      },
                    ),
                    800.h.hSpace,
                  ],
                ),
              ),
              CustomScrollWidget(
                controller: _page,
                children: [
                  const OverviewWidget(),
                  const AboutWidget(),
                  const EssenceWidget1(),
                  const EssenceWidget2(),
                  const CareerWidget(),
                  const JourneyWidget1(),
                  const JourneyWidget2(),
                  const ProgressWidget(),
                  const CountdownWidget(),
                  FooterWidget(
                    controller: _page,
                  ),
                ],
              ),
              // PageView(
              //   controller: _page,
              //   onPageChanged: (value) {
              //     page = value;
              //     setState(() {});
              //   },
              //   scrollDirection: Axis.vertical,
              //   children: [
              //     const OverviewWidget(),
              //     const AboutWidget(),
              //     EssenceWidget(
              //       page: page,
              //     ),
              //     const CareerWidget(),
              //     const JourneyWidget1(),
              //     const JourneyWidget2(),
              //     const ProgressWidget(),
              //     const CountdownWidget(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
