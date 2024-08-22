import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FooterTextButton(
                    title: S.current.home,
                    onTap: () {
                      controller.animateTo(
                        0,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.linear,
                      );
                    },
                  ),
                  8.w.hSpace,
                  FooterTextButton(
                    title: S.current.about,
                    onTap: () {
                      controller.animateTo(
                        800.w,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.linear,
                      );
                    },
                  ),
                  8.w.hSpace,
                  FooterTextButton(
                    title: S.current.candidateProfile,
                    onTap: () {
                      controller.animateTo(
                        1700.w,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ],
              ),
              40.w.wSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FooterTextButton(
                    onTap: () {
                      controller.animateTo(
                        3350.w,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.linear,
                      );
                    },
                    title: S.current.openOpportunities,
                  ),
                  8.w.hSpace,
                  FooterTextButton(
                    onTap: () {
                      controller.animateTo(
                        4150.w,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.linear,
                      );
                    },
                    title: S.current.developmentJourney,
                  ),
                  8.w.hSpace,
                  FooterTextButton(
                    onTap: () {
                      controller.animateTo(
                        5650.w,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear,
                      );
                    },
                    title: S.current.selectionProcess,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FooterIconButton(
                    child: Assets.images.footer.facebook.image(),
                    onTap: () {
                      launchUrlString(
                          'https://www.facebook.com/ccbvl?mibextid=ZbWKwL');
                    },
                  ),
                  24.w.wSpace,
                  FooterIconButton(
                    child: Assets.images.footer.group.image(),
                    onTap: () {
                      launchUrlString(
                          'https://www.facebook.com/groups/cocacolayoungtalents/?ref=share&mibextid=NSMWBT');
                    },
                  ),
                  24.w.wSpace,
                  FooterIconButton(
                    child: Assets.images.footer.linkedin.image(),
                    onTap: () {
                      launchUrlString(
                          'https://www.linkedin.com/company/cocacolavietnam/');
                    },
                  ),
                  24.w.wSpace,
                  Tooltip(
                    message: 'recruitment@coca-cola.com.vn',
                    child: FooterIconButton(
                      child: Assets.images.footer.mail.image(),
                      onTap: () {
                        launchUrlString('mailto:recruitment@coca-cola.com.vn');
                      },
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

class FooterIconButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const FooterIconButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  State<FooterIconButton> createState() => _FooterIconButtonState();
}

class _FooterIconButtonState extends State<FooterIconButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
        decoration: BoxDecoration(
          color: isHover ? Colors.white.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: SizedBox(
          width: 32.w,
          height: 32.w,
          child: widget.child,
        ),
      ),
    );
  }
}

class FooterTextButton extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  const FooterTextButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<FooterTextButton> createState() => _FooterTextButtonState();
}

class _FooterTextButtonState extends State<FooterTextButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        decoration: BoxDecoration(
          color: isHover ? Colors.white.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
