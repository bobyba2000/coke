import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MobileFooterWidget extends StatelessWidget {
  final ScrollController controller;
  final GlobalKey overview;
  final GlobalKey about;
  final GlobalKey essence;
  final GlobalKey career;
  final GlobalKey journey;
  final GlobalKey progress;
  const MobileFooterWidget({
    super.key,
    required this.controller,
    required this.overview,
    required this.about,
    required this.essence,
    required this.career,
    required this.journey,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400.w,
      padding: EdgeInsets.symmetric(
        horizontal: 120.w,
        vertical: 30.w,
      ),
      color: const Color(0xFF28A549),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.logoWhite.image(
            width: 180,
            fit: BoxFit.fitWidth,
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 24,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FooterTextButton(
                title: S.current.home,
                onTap: () {
                  final keyContext = overview.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero);
                    controller.animateTo(
                      position.dy + controller.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              8.w.hSpace,
              FooterTextButton(
                title: S.current.about,
                onTap: () {
                  final keyContext = about.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero);
                    controller.animateTo(
                      position.dy + controller.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              8.w.hSpace,
              FooterTextButton(
                title: S.current.candidateProfile,
                onTap: () {
                  final keyContext = essence.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero);
                    controller.animateTo(
                      position.dy + controller.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              FooterTextButton(
                onTap: () {
                  final keyContext = career.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero);
                    controller.animateTo(
                      position.dy + controller.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.linear,
                    );
                  }
                },
                title: S.current.openOpportunities,
              ),
              8.w.hSpace,
              FooterTextButton(
                onTap: () {
                  final keyContext = journey.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero);
                    controller.animateTo(
                      position.dy + controller.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.linear,
                    );
                  }
                },
                title: S.current.developmentJourney,
              ),
              8.w.hSpace,
              FooterTextButton(
                onTap: () {
                  final keyContext = progress.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    Offset position = box.localToGlobal(Offset.zero);
                    controller.animateTo(
                      position.dy + controller.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                    );
                  }
                },
                title: S.current.selectionProcess,
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FooterIconButton(
                child: Assets.images.footer.facebook.image(),
                onTap: () {
                  launchUrlString('https://www.facebook.com/ccbvl?mibextid=ZbWKwL');
                },
              ),
              24.w.wSpace,
              FooterIconButton(
                child: Assets.images.footer.group.image(),
                onTap: () {
                  launchUrlString('https://www.facebook.com/groups/cocacolayoungtalents/?ref=share&mibextid=NSMWBT');
                },
              ),
              24.w.wSpace,
              FooterIconButton(
                child: Assets.images.footer.linkedin.image(),
                onTap: () {
                  launchUrlString('https://www.linkedin.com/company/cocacolavietnam/');
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
          ),
          8.hSpace,
          const Text(
            '© 2024 Coca-Cola Beverages Vietnam. All rights reserved.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
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
          width: 16,
          height: 16,
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
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
