import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

enum JourneyCharacter {
  f,
  r,
  e,
  s,
  h;

  String get title {
    switch (this) {
      case JourneyCharacter.f:
        return S.current.fTitle;
      case JourneyCharacter.r:
        return S.current.rTitle;
      case JourneyCharacter.e:
        return S.current.eTitle;
      case JourneyCharacter.s:
        return S.current.sTitle;
      case JourneyCharacter.h:
        return S.current.hTitle;
    }
  }

  String get content {
    switch (this) {
      case JourneyCharacter.f:
        return S.current.fContent;
      case JourneyCharacter.r:
        return S.current.rContent;
      case JourneyCharacter.e:
        return S.current.eContent;
      case JourneyCharacter.s:
        return S.current.sContent;
      case JourneyCharacter.h:
        return S.current.hContent;
    }
  }

  Color get color {
    switch (this) {
      case JourneyCharacter.f:
        return const Color(0xFF8C45F6);
      case JourneyCharacter.r:
        return const Color(0xFFFE0036);
      case JourneyCharacter.e:
        return const Color(0xFF28A549);
      case JourneyCharacter.s:
        return const Color(0xFFE7661F);
      case JourneyCharacter.h:
        return const Color(0xFF486EB3);
    }
  }

  Widget get mobileWidget {
    final titleStr = title.split(';');
    Widget titleWidget = Text(
      titleStr.last,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: Color(0xFF035858),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.wSpace,
            Container(
              alignment: Alignment.center,
              width: 40,
              color: const Color(0xFFD6F5F4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 24,
                      height: 0.8,
                    ),
                  ),
                ],
              ),
            ),
            16.wSpace,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleWidget,
                  4.hSpace,
                  Text(
                    content,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      height: 1.15,
                      color: Color(0xFF035858),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            16.wSpace,
          ],
        ),
      ),
    );
  }

  Widget get widget {
    final titleStr = title.split(';');
    Widget titleWidget = Text(
      titleStr.last,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: const Color(0xFF035858),
      ),
    );
    Widget subTitle = const SizedBox.shrink();
    if (titleStr.length > 1) {
      subTitle = Text(
        titleStr.first,
        style: TextStyle(
          fontSize: 10.sp,
          fontStyle: FontStyle.italic,
          color: color,
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            alignment: Alignment.center,
            color: const Color(0xFFD6F5F4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                    fontSize: 38.sp,
                    height: 0.8,
                  ),
                ),
                subTitle,
              ],
            ),
          ),
        ),
        20.h.hSpace,
        titleWidget,
        10.hSpace,
        Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16.spMin,
            height: 1.1.wMax,
            color: const Color(0xFF035858),
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class JourneyWidget1 extends StatelessWidget {
  final GlobalKey flowKey;
  const JourneyWidget1({super.key, required this.flowKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1400.w,
      height: 700.w,
      child: Column(
        children: [
          80.w.hSpace,
          Text(
            S.current.cokeJourney.toUpperCase(),
            style: TextStyle(
              fontSize: 38.sp,
              color: const Color(0xFFE7661F),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          FadeInLeft(
            globalKey: flowKey,
            child: LocaleUtility.locale.value.languageCode == 'en'
                ? Assets.images.journey.en.image(
                    width: 1300.w,
                  )
                : Assets.images.journey.vi.image(
                    width: 1300.w,
                  ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class JourneyWidget2 extends StatelessWidget {
  const JourneyWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800.w,
      width: 1400.w,
      padding: EdgeInsets.symmetric(horizontal: 100.w),
      child: Column(
        children: [
          const Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.w),
            color: const Color(0xFFD6F5F4),
            alignment: Alignment.center,
            child: Text(
              S.current.journeyTimeline.toUpperCase(),
              style: TextStyle(
                fontSize: 22.sp,
                color: const Color(0xFF1A6CC8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          40.w.hSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: JourneyCharacter.f.widget,
              ),
              16.w.wSpace,
              Expanded(
                child: JourneyCharacter.r.widget,
              ),
              16.w.wSpace,
              Expanded(
                child: JourneyCharacter.e.widget,
              ),
              16.w.wSpace,
              Expanded(
                child: JourneyCharacter.s.widget,
              ),
              16.w.wSpace,
              Expanded(
                child: JourneyCharacter.h.widget,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFilledButton(
                title: S.current.applyNow,
                onTap: () {
                  context.go('/apply');
                },
              ),
            ],
          ),
          50.w.hSpace
        ],
      ),
    );
  }
}
