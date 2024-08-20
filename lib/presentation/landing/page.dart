import 'dart:async';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/about/widget.dart';
import 'package:coke_platform/presentation/landing/career/widget.dart';
import 'package:coke_platform/presentation/landing/essence/widget.dart';
import 'package:coke_platform/presentation/landing/overview/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'page1.dart';

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

  @override
  void initState() {
    _page.addListener(() {
      if (_page.offset < 1600.w) {
        _background.jumpTo(_page.offset);
      } else if (_page.offset > 2400.w) {
        _background.jumpTo(_page.offset - 800.w);
      }
    });

    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        timer = Timer.periodic(
          const Duration(milliseconds: 200),
          (timer) {
            final pixels = _page.position.pixels;

            if (pixels != previousPosition && !isScrolling) {
              _onStartScroll();
            }
            if (pixels == previousPosition && isScrolling) {
              _onEndScroll();
            }
            previousPosition = pixels;
          },
        );
      },
    );

    super.initState();
  }

  void _onStartScroll() {
    isScrolling = true;
    if (mounted) {
      setState(() {});
    }
  }

  void _onEndScroll() {
    isScrolling = false;

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MouseRegion(
        onHover: (event) {
          final scrollBarPosition = 1400.w - 200;
          if (event.localPosition.dx > scrollBarPosition) {
            setState(() {
              isScrollbarHover = true;
            });
          } else {
            setState(() {
              isScrollbarHover = false;
            });
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              controller: _background,
              child: Column(
                children: [
                  SizedBox(
                    height: 1600.w,
                    width: 1400.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Assets.images.landingPageBackground.image(
                          height: 1600.w,
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
                        Positioned(
                          bottom: 120.w,
                          right: 90.w,
                          child: Assets.images.about.model.image(
                            width: 800.w,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1400.w,
                    height: 900.w,
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          color: const Color(0xFF406eb6),
                          height: 800.w,
                          margin: EdgeInsets.only(bottom: 100.w),
                          width: double.infinity,
                          child: Assets.images.essence.background.image(
                            height: 800.w,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          left: 300.w,
                          top: 200.w,
                          child: Assets.images.essence.model.image(
                            width: 600.w,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Assets.images.essence.bottom.image(
                            width: 1400.w,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          left: 300.w,
                          right: 300.w,
                          top: 40.w,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                S.current.essenceTitle.toUpperCase(),
                                style: TextStyle(
                                  color: ColorConstants.colorFFF220,
                                  fontSize: 45.sp,
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
                  Container(
                    height: 800.w,
                    width: 1400.w,
                    color: const Color(0xFFf1feff),
                  ),
                  Container(
                    height: 900.h,
                    width: 1400.w,
                    color: Colors.white,
                    child: Column(
                      children: [
                        80.h.hSpace,
                        Text(
                          S.current.cokeJourney,
                          style: TextStyle(
                            fontSize: 45.sp,
                            color: const Color(0xFFE7661F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 900.h,
                    width: 1400.w,
                    color: Colors.white,
                    child: Column(
                      children: [
                        80.h.hSpace,
                        Text(
                          S.current.cokeJourney,
                          style: TextStyle(
                            fontSize: 45.sp,
                            color: const Color(0xFFE7661F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1100.h,
                    width: 1400.w,
                    color: const Color(0xFF9833ff),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          height: 100.h,
                          width: 1400.w,
                          child: Assets.images.progress.transition.image(
                            fit: BoxFit.fill,
                          ),
                        ),
                        Assets.images.progress.background.image(
                          width: 1400.w,
                          height: 1100.h,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 700.h,
                    width: 1400.w,
                    color: const Color(0xFF31cccc),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Assets.images.about.background.image(),
                        Positioned(
                          bottom: 0,
                          width: 1400.w,
                          height: 100.h,
                          left: 0,
                          child: Assets.images.progress.bottom.image(
                            width: 1400.w,
                            height: 100.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     const JourneyWidget1(),
                //     const JourneyWidget2(),
                //   ],
                // ),
                // const ProgressWidget(),
                // const CountdownWidget(),
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
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
