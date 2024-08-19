import 'dart:async';

import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/presentation/landing/about/widget.dart';
import 'package:coke_platform/presentation/landing/appbar/widget.dart';
import 'package:coke_platform/presentation/landing/essence/widget.dart';
import 'package:coke_platform/presentation/landing/overview/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'career/widget.dart';
import 'widget/progress.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _background = ScrollController();
  final PageController _page = PageController();
  bool isScrolling = false;
  late Timer timer;
  num previousPosition = 0;
  int page = 0;
  bool isScrollbarHover = false;

  @override
  void initState() {
    _page.addListener(() {
      if (_page.offset != _background.offset) {
        _background.jumpTo(_page.offset);
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
                    height: 1800.h,
                    width: 1400.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Assets.images.landingPageBackground.image(
                          height: 1800.h,
                          width: 1400.w,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 90.w,
                          child: Assets.images.about.model.image(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1400.w,
                    height: 1000.h,
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          color: const Color(0xFF406eb6),
                          height: 900.h,
                          margin: EdgeInsets.only(bottom: 100.h),
                          width: double.infinity,
                          child: Assets.images.essence.background.image(
                            height: 900.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Assets.images.essence.bottom.image(
                            width: 1400.w,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 800.h,
                    width: 1400.w,
                    color: const Color(0xFFf1feff),
                  ),
                ],
              ),
            ),
            Scrollbar(
              controller: _page,
              thumbVisibility: true,
              trackVisibility: true,
              child: PageView(
                controller: _page,
                onPageChanged: (value) {
                  page = value;
                  setState(() {});
                },
                scrollDirection: Axis.vertical,
                children: [
                  const OverviewWidget(),
                  const AboutWidget(),
                  EssenceWidget(
                    page: page,
                  ),
                  const CareerWidget(),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isScrolling ? 0 : 1,
                child: LandingPageAppbar(
                  showLogo: page != 0,
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 10,
              child: Builder(builder: (context) {
                LandingPageType type = LandingPageType.values[page];

                return AnimatedOpacity(
                  opacity: isScrollbarHover ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: ProgressWidget(
                    current: type,
                    onSelect: (value) {
                      _page.animateToPage(
                        value.index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                  ),
                );
              }),
            )
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
