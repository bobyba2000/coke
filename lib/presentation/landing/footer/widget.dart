import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterWidget extends StatelessWidget {
  final ScrollController controller;
  const FooterWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400.w,
      height: 450.w,
      padding: EdgeInsets.symmetric(
        horizontal: 120.w,
        vertical: 30.w,
      ),
      color: const Color(0xFF28A549),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.images.logoWhite.image(
            width: 380.w,
            fit: BoxFit.fitWidth,
          ),
          40.w.hSpace,
          const Divider(
            color: Colors.white,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      S.current.home,
                    ),
                  ),
                  8.hSpace,
                  TextButton(
                    onPressed: () {
                      controller.animateTo(
                        700.w,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      S.current.about,
                    ),
                  ),
                  8.hSpace,
                  TextButton(
                    onPressed: () {
                      controller.animateTo(
                        1600.w,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      S.current.candidateProfile,
                    ),
                  ),
                ],
              ),
              40.w.wSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.animateTo(
                        3200.w,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      S.current.openOpportunities,
                    ),
                  ),
                  8.hSpace,
                  TextButton(
                    onPressed: () {
                      controller.animateTo(
                        4000.w,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      S.current.developmentJourney,
                    ),
                  ),
                  8.hSpace,
                  TextButton(
                    onPressed: () {
                      controller.animateTo(
                        4700.w,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                    child: Text(
                      S.current.selectionProcess,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '© 2024 Coca-Cola Beverages Vietnam. All rights reserved.',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
