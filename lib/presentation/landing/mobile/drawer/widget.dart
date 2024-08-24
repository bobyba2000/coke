import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileDrawer extends StatelessWidget {
  final ScrollController controller;
  final GlobalKey overview;
  final GlobalKey about;
  final GlobalKey essence;
  final GlobalKey career;
  final GlobalKey journey;
  final GlobalKey progress;
  const MobileDrawer({
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
    final auth = AppDependencies.injector.get<FirebaseAuthService>();
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      shadowColor: Colors.white,
      width: 300,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Assets.images.logoWhite.image(
                    width: 136,
                  ),
                  const Spacer(),
                ],
              ),
              20.hSpace,
              const Divider(
                color: Colors.white,
                thickness: 1,
                height: 1,
              ),
              24.hSpace,
              drawerButton(
                context,
                S.current.home,
                onTap: () {
                  final keyContext = overview.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    final offset = box.localToGlobal(Offset.zero);

                    controller.animateTo(
                      offset.dy + controller.offset,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              40.hSpace,
              drawerButton(
                context,
                S.current.about,
                onTap: () {
                  final keyContext = about.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    final offset = box.localToGlobal(Offset.zero);

                    controller.animateTo(
                      offset.dy + controller.offset - 40,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              40.hSpace,
              drawerButton(
                context,
                S.current.candidateProfile,
                onTap: () {
                  final keyContext = essence.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    final offset = box.localToGlobal(Offset.zero);

                    controller.animateTo(
                      offset.dy + controller.offset - 40,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              40.hSpace,
              drawerButton(
                context,
                S.current.openOpportunities,
                onTap: () {
                  final keyContext = career.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    final offset = box.localToGlobal(Offset.zero);

                    controller.animateTo(
                      offset.dy + controller.offset - 40,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              40.hSpace,
              drawerButton(
                context,
                S.current.developmentJourney,
                onTap: () {
                  final keyContext = journey.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    final offset = box.localToGlobal(Offset.zero);

                    controller.animateTo(
                      offset.dy + controller.offset - 40,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              40.hSpace,
              drawerButton(
                context,
                S.current.selectionProcess,
                onTap: () {
                  final keyContext = progress.currentContext;
                  if (keyContext != null) {
                    RenderBox box = keyContext.findRenderObject() as RenderBox;
                    final offset = box.localToGlobal(Offset.zero);

                    controller.animateTo(
                      offset.dy + controller.offset - 40,
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.linear,
                    );
                  }
                },
              ),
              20.hSpace,
              const Divider(
                color: Colors.white,
                thickness: 1,
                height: 1,
              ),
              24.hSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomFilledButton(
                      title: S.current.applyNow,
                      onTap: () {
                        context.go('/apply');
                      },
                    ),
                  ),
                  16.wSpace,
                  Expanded(
                    child: CustomFilledButton(
                      title: auth.isUserSignedIn() ? S.current.profile : S.current.login,
                      onTap: () {
                        context.go('/login');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerButton(
    BuildContext context,
    String title, {
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          16.wSpace,
          const Icon(
            Icons.chevron_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
