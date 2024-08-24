import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:coke_platform/presentation/landing/journey/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MobileJourneyWidget extends StatelessWidget {
  const MobileJourneyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400.w,
      color: Colors.white,
      child: Column(
        children: [
          24.hSpace,
          Text(
            S.current.cokeJourney.toUpperCase(),
            style: const TextStyle(
              fontSize: 24,
              color: Color(0xFFE7661F),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          40.hSpace,
          LocaleUtility.locale.value.languageCode == 'en'
              ? Assets.images.journey.en.image(
                  width: 1300.w,
                )
              : Assets.images.journey.vi.image(
                  width: 1300.w,
                ),
          40.hSpace,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: const Color(0xFFD6F5F4),
            alignment: Alignment.center,
            child: Text(
              S.current.journeyTimeline.toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF1A6CC8),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          40.hSpace,
          ...JourneyCharacter.values.map(
            (e) => e.mobileWidget,
          ),
          24.hSpace,
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
          16.hSpace,
          Container(
            color: const Color(0xFF9833ff),
            width: 1400.w,
            child: Assets.images.progress.transition.image(
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
