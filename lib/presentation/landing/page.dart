import 'dart:async';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/share_preference.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/about/widget.dart';
import 'package:coke_platform/presentation/landing/career/widget.dart';
import 'package:coke_platform/presentation/landing/essence/widget.dart';
import 'package:coke_platform/presentation/landing/footer/widget.dart';
import 'package:coke_platform/presentation/landing/overview/widget.dart';
import 'package:flutter/material.dart';
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

  final journey1Key = GlobalKey();
  final footerKey = GlobalKey();

  final careerModelKey = GlobalKey();
  final journeyFlowKey = GlobalKey();
  final essence1Key = GlobalKey();

  @override
  void initState() {
    _page.addListener(manageScroll);

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
                            top: 1400.w * 1.5 < 900.h ? 900.w : 140.w,
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
                            top: 10.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  S.current.essenceTitle.toUpperCase(),
                                  style: TextStyle(
                                    color: const Color(0xFF19FFFE),
                                    fontSize: 38.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                8.hSpace,
                                Text(
                                  S.current.essenceContent1,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    height: 1.3.wMax,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 800.w,
                      width: 1400.w,
                      color: const Color(0xFFf1feff),
                    ),
                    Container(
                      height: 1500.w,
                      width: 1400.w,
                      color: Colors.white,
                    ),
                    Container(
                      color: const Color(0xFF30cccc),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 1120.w,
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
                                  height: 1120.w,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    height: 10,
                                    color: const Color(0xFF30cccc),
                                    width: 1400.w,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 500.w,
                            width: 1400.w,
                            color: const Color(0xFF31cccc),
                            child: Stack(
                              children: [
                                Assets.images.countdown.background.image(
                                  height: 600.w,
                                  width: 1400.w,
                                  fit: BoxFit.fill,
                                ),
                                Positioned(
                                  bottom: 0,
                                  width: 1400.w,
                                  height: 100.h,
                                  left: 0,
                                  child: Stack(
                                    children: [
                                      Assets.images.progress.bottom.image(
                                        width: 1400.w,
                                        height: 100.h,
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          color: const Color(0xFF28A549),
                                          height: 10,
                                          width: 1400.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (footerKey.currentContext != null) {
                          final box = footerKey.currentContext!.findRenderObject() as RenderBox;
                          return Container(
                            color: const Color(0xFF28A549),
                            width: 1400.w,
                            height: box.size.height,
                          );
                        }
                        return Container(
                          color: const Color(0xFF28A549),
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
                  EssenceWidget1(
                    essence1Key: essence1Key,
                  ),
                  const EssenceWidget2(),
                  CareerWidget(
                    modelKey: careerModelKey,
                  ),
                  JourneyWidget1(
                    flowKey: journeyFlowKey,
                  ),
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

  void manageScroll() {
    if (1400.w * 1.5 < 900.h) {
      _background.jumpTo(_page.offset);
    } else {
      if (_page.offset < 1700.w) {
        _background.jumpTo(_page.offset);
      } else if (_page.offset > 2500.w) {
        _background.jumpTo(_page.offset - 800.w);
      } else {
        _background.jumpTo(1700.w);
      }
    }
  }

  @override
  void dispose() {
    _page.removeListener(manageScroll);
    super.dispose();
  }
}
