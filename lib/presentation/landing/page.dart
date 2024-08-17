import 'dart:async';
import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/common/utility/share_preference.dart';
import 'package:coke_platform/common/widget/scroll/scroll_transform_item.dart';
import 'package:coke_platform/common/widget/scroll/scroll_transform_view.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/appbar/widget.dart';
import 'package:coke_platform/presentation/landing/career/widget.dart';
import 'package:coke_platform/presentation/landing/overview/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'about/widget.dart';
import 'widget/progress.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  bool isScrolling = false;
  late Timer timer;
  num previousPosition = 0;
  bool isScrollbarHover = false;

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
    timer = Timer.periodic(
      const Duration(milliseconds: 200),
      (timer) {
        final pixels = _scrollController.position.pixels;
        if (pixels != previousPosition && !isScrolling) {
          _onStartScroll();
        }
        if (pixels == previousPosition && isScrolling) {
          _onEndScroll();
        }
        previousPosition = pixels;
      },
    );
    super.initState();
  }

  final aboutKey = GlobalKey();

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

    // double? offset;
    // final scrollOffset = _scrollController.position.pixels;
    // if (scrollOffset > homeHeight * 0.7 && scrollOffset < homeHeight) {
    //   offset = homeHeight;
    // }
    // if (scrollOffset > (homeHeight + aboutHeight * 0.7) && scrollOffset < (aboutHeight + homeHeight)) {
    //   offset = aboutHeight + homeHeight;
    // }
    // if (scrollOffset > (essenceHeight * 0.7 + homeHeight + aboutHeight) && scrollOffset < (essenceHeight + homeHeight + aboutHeight)) {
    //   offset = essenceHeight + homeHeight + aboutHeight;
    // }
    // if (offset != null) {
    //   _scrollController.animateTo(
    //     offset,
    //     duration: const Duration(milliseconds: 300),
    //     curve: Curves.linear,
    //   );
    // }
  }

  final homeHeight = 1000.h;
  final aboutHeight = 1000.h + 1200.w;
  final essenceHeight = 1000.h + 1200.w + 900.w * 2 + 745.w;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: ColorConstants.teal,
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
          children: [
            Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              controller: _scrollController,
              child: ScrollTransformView(
                scrollController: _scrollController,
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
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isScrolling ? 0 : 1,
              child: const LandingPageAppbar(),
            ),
            Positioned(
              right: 20,
              bottom: 10,
              child: Builder(builder: (context) {
                LandingPageType type = LandingPageType.home;
                final scrollOffset = _scrollController.position.pixels;
                if (scrollOffset >= homeHeight) {
                  type = LandingPageType.about;
                }
                if (scrollOffset >= aboutHeight) {
                  type = LandingPageType.candidateProfile;
                }
                if (scrollOffset >= essenceHeight) {
                  type = LandingPageType.openOpportunities;
                }
                return AnimatedOpacity(
                  opacity: isScrollbarHover ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: ProgressWidget(
                    current: type,
                    onSelect: (value) {
                      double offset = 0;
                      switch (value) {
                        case LandingPageType.home:
                          offset = 0;
                          break;
                        case LandingPageType.about:
                          offset = homeHeight;
                          break;
                        case LandingPageType.candidateProfile:
                          offset = aboutHeight;
                          break;
                        case LandingPageType.openOpportunities:
                          offset = essenceHeight;
                          break;
                      }
                      // int time = (scrollOffset - offset) ~/ 2;
                      _scrollController.animateTo(
                        offset,
                        duration: const Duration(
                          milliseconds: 400,
                        ),
                        curve: Curves.easeIn,
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
