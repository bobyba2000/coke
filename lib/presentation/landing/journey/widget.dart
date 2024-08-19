import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JourneyWidget extends StatelessWidget {
  const JourneyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 900.h,
      width: 1400.w,
      child: Column(
        children: [
          80.h.hSpace,
          Text(
            S.current.cokeJourney,
            style: const TextStyle(
              fontSize: 45,
              color: Color(0xFFE7661F),
              fontWeight: FontWeight.bold,
            ),
          ),
          100.h.hSpace,
          LocaleUtility.locale.value.languageCode == 'en'
              ? Assets.images.journey.en.image(
                  width: 1000.w,
                )
              : Assets.images.journey.vi.image(
                  width: 1000.w,
                ),
        ],
      ),
    );
  }
}
