import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  Widget get widget {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 2.5,
          child: Container(
            alignment: Alignment.center,
            color: const Color(0xFFD6F5F4),
            child: Text(
              name.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: 45.sp,
              ),
            ),
          ),
        ),
        20.h.hSpace,
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: const Color(0xFF035858),
          ),
        ),
        10.hSpace,
        Text(
          content,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15.sp,
            color: const Color(0xFF035858),
          ),
        ),
      ],
    );
  }
}

class JourneyWidget1 extends StatelessWidget {
  const JourneyWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      width: 1400.w,
      child: Column(
        children: [
          200.h.hSpace,
          LocaleUtility.locale.value.languageCode == 'en'
              ? Assets.images.journey.en.image(
                  width: 1200.w,
                )
              : Assets.images.journey.vi.image(
                  width: 1200.w,
                ),
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
      height: 900.h,
      width: 1400.w,
      padding: EdgeInsets.symmetric(horizontal: 100.w),
      child: Column(
        children: [
          200.h.hSpace,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            color: const Color(0xFFD6F5F4),
            alignment: Alignment.center,
            child: Text(
              S.current.journeyTimeline.toUpperCase(),
              style: TextStyle(fontSize: 22.sp, color: const Color(0xFF1A6CC8), fontWeight: FontWeight.bold),
            ),
          ),
          40.hSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Row(
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
            ),
          ),
          100.h.hSpace,
          CustomFilledButton(
            title: S.current.applyNow,
            onTap: () {
              context.go('/apply');
            },
          ),
          50.h.hSpace
        ],
      ),
    );
  }
}
