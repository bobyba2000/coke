import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/common/widget/scroll/scroll_transform_item.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EssenceWidget1 extends StatefulWidget {
  final GlobalKey essence1Key;
  const EssenceWidget1({super.key, required this.essence1Key});

  @override
  State<EssenceWidget1> createState() => _EssenceWidget1State();
}

class _EssenceWidget1State extends State<EssenceWidget1> {
  @override
  Widget build(BuildContext context) {
    final sales = S.current.saleRoleContent.split(';');
    final others = S.current.otherRoleContent.split(';');

    return ScrollTransformItem(
      scaleBuilder: (scrollOffset) {
        double percentage = 1;
        final heightBefore = 1700.w;

        if (scrollOffset > heightBefore) {
          if (scrollOffset - heightBefore < 400.w) {
            percentage = max(
              1 + (scrollOffset - heightBefore) / 400.w,
              1,
            );
          } else {
            percentage = 2;
          }
        }
        if (1400.w * 1.5 < 900.h) {
          percentage = 1;
        }
        return percentage;
      },
      builder: (scrollOffset) {
        double percentage = 1;
        final heightBefore = 1700.w;

        if (scrollOffset > heightBefore) {
          if (scrollOffset - heightBefore < 400.w) {
            percentage = max(
              1 - (scrollOffset - heightBefore) / 400.w,
              0,
            );
          } else {
            percentage = 0;
          }
        }
        if (1400.w * 1.5 < 900.h) {
          percentage = 1;
        }
        return SizedBox(
          width: 1400.w,
          height: 800.w,
          child: Stack(
            children: [
              Opacity(
                opacity: percentage,
                child: ValueListenableBuilder(
                  valueListenable: LocaleUtility.locale,
                  builder: (context, locale, child) {
                    return locale.languageCode == 'en'
                        ? Assets.images.essence.en1.image(
                            width: 1400.w,
                            fit: BoxFit.fitWidth,
                          )
                        : Assets.images.essence.vi1.image(
                            width: 1400.w,
                            fit: BoxFit.fitWidth,
                          );
                  },
                ),
              ),
              if (1400.w * 1.5 < 900.h || scrollOffset < heightBefore + 10.w)
                Positioned(
                  left: 300.w,
                  top: 240.w,
                  child: Assets.images.essence.model.image(
                    width: 600.w,
                  ),
                ),
              Opacity(
                opacity: percentage,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    500.w.hSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        150.w.wSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              sales.length,
                              (index) {
                                final sale = sales[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.wMin),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 8.sp,
                                        ),
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.white,
                                          size: 10.spMin,
                                        ),
                                      ),
                                      16.w.wSpace,
                                      Expanded(
                                        child: Text(
                                          sale,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.spMin,
                                            fontWeight: FontWeight.w400,
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
                        400.w.wSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              others.length,
                              (index) {
                                final other = others[index];
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.wMin),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 8.sp),
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.white,
                                          size: 10.spMin,
                                        ),
                                      ),
                                      16.w.wSpace,
                                      Expanded(
                                        child: Text(
                                          other,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.spMin,
                                            fontWeight: FontWeight.w400,
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
                        150.w.wSpace,
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EssenceWidget2 extends StatefulWidget {
  const EssenceWidget2({super.key});

  @override
  State<EssenceWidget2> createState() => _EssenceWidget2State();
}

class _EssenceWidget2State extends State<EssenceWidget2> {
  @override
  Widget build(BuildContext context) {
    return ScrollTransformItem(
      builder: (scrollOffset) {
        double percentage = 0;
        if (scrollOffset > 2000.w) {
          percentage = min(max((scrollOffset - 2000.w) / 400.w, 0), 1);
        }

        if (1400.w * 1.5 < 900.h) {
          percentage = 1;
        }
        return Opacity(
          opacity: percentage,
          child: SizedBox(
            height: 900.w,
            child: ValueListenableBuilder(
              valueListenable: LocaleUtility.locale,
              builder: (context, locale, child) {
                return Column(
                  children: [
                    200.w.hSpace,
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            left: 25.w,
                            right: 25.w,
                            child: locale.languageCode == 'en'
                                ? Assets.images.essence.winning.image(
                                    height: 350.w,
                                    fit: BoxFit.fitHeight,
                                  )
                                : Assets.images.essence.winningVi.image(
                                    height: 350.w,
                                    fit: BoxFit.fitHeight,
                                  ),
                          ),
                          Positioned(
                            top: 290.w,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                locale.languageCode == 'en'
                                    ? Assets.images.essence.en2.image(
                                        width: 1400.w,
                                        fit: BoxFit.fitWidth,
                                      )
                                    : Assets.images.essence.vi2.image(
                                        width: 1400.w,
                                        fit: BoxFit.fitWidth,
                                      ),
                                Positioned(
                                  top: 280.w,
                                  child: Text(
                                    S.current.functionalSkillsText,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: const Color(0xFFfe6a00),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
