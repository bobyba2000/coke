import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/common/widget/scroll/scroll_transform_item.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EssenceWidget extends StatefulWidget {
  final int page;
  const EssenceWidget({super.key, required this.page});

  @override
  State<EssenceWidget> createState() => _EssenceWidgetState();
}

class _EssenceWidgetState extends State<EssenceWidget> with AutomaticKeepAliveClientMixin<EssenceWidget> {
  final scrollController = ScrollController();
  bool isCurrent = false;
  bool isOver = true;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset > 450.h) {
        isOver = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant EssenceWidget oldWidget) {
    if (widget.page == 2) {
      Future.delayed(
        const Duration(milliseconds: 400),
        () {
          setState(() {
            isCurrent = true;
          });
        },
      );
    } else {
      setState(() {
        isCurrent = false;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SizedBox(
      height: 900.h,
      width: 1400.w,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              90.hSpace,
              Text(
                S.current.essenceTitle.toUpperCase(),
                style: textTheme.displaySmall?.copyWith(
                  color: ColorConstants.colorFFF220,
                  fontSize: 48.spMax,
                ),
              ),
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
          Positioned(
            left: 300.w,
            top: 200.w,
            child: Assets.images.essence.model.image(
              width: 600.w,
            ),
          ),
          SingleChildScrollView(
            controller: scrollController,
            physics: isCurrent ? null : const NeverScrollableScrollPhysics(),
            child: ChangeNotifierProvider(
              create: (context) => scrollController,
              child: Column(
                children: [
                  ScrollTransformItem(
                    scaleBuilder: (scrollOffset) {
                      double percentage = 0;
                      if (scrollOffset < 500.h) {
                        percentage = max(
                          1 + scrollOffset / 500.h,
                          1,
                        );
                      }
                      return percentage;
                    },
                    builder: (scrollOffset) {
                      final sales = S.current.saleRoleContent.split(';');
                      final others = S.current.otherRoleContent.split(';');
                      double percentage = 0;
                      double width = 1400.w;
                      if (scrollOffset < 500.h) {
                        percentage = max(
                          1 - scrollOffset / 500.h,
                          0,
                        );
                      }
                      return SizedBox(
                        width: width,
                        height: 900.h,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Opacity(
                              opacity: percentage,
                              child: ValueListenableBuilder(
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
                            ),
                            if (scrollOffset < 10.h)
                              Positioned(
                                left: 300.w,
                                top: 200.w,
                                child: Assets.images.essence.model.image(
                                  width: 600.w,
                                ),
                              ),
                            Opacity(
                              opacity: percentage,
                              child: Column(
                                children: [
                                  600.h.hSpace,
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      200.w.wSpace,
                                      SizedBox(
                                        width: 400.w,
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
                                        width: 400.w,
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
                                      200.w.wSpace,
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ScrollTransformItem(
                    scaleBuilder: (scrollOffset) {
                      double percentage = 0;
                      if (scrollOffset > 400.h) {
                        percentage = max(
                          1 + (900.h - scrollOffset) / 900.h,
                          1,
                        );
                      }
                      return percentage;
                    },
                    builder: (scrollOffset) {
                      double percentage = 0;
                      if (scrollOffset > 400.h) {
                        percentage = min(max((scrollOffset - 400.h) / 450.h, 0), 1);
                      }
                      return Opacity(
                        opacity: percentage,
                        child: SizedBox(
                          height: 900.h,
                          child: Column(
                            children: [
                              150.h.hSpace,
                              Assets.images.essence.en2.image(
                                width: 1200.w,
                                height: 700.h,
                                fit: BoxFit.fill,
                              ),
                              50.h.hSpace,
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
