import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WinningAttributeWidget extends StatelessWidget {
  final String title;
  const WinningAttributeWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFeffdff),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFeffdff).withOpacity(0.5),
            offset: const Offset(0, 7),
            blurRadius: 29,
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 8,
          color: Color(0xFF4975ba),
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class EssenceWidget extends StatefulWidget {
  const EssenceWidget({super.key});

  @override
  State<EssenceWidget> createState() => _EssenceWidgetState();
}

class _EssenceWidgetState extends State<EssenceWidget> {
  final random = Random();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sales = S.current.saleRoleContent.split(';');
    final others = S.current.otherRoleContent.split(';');
    return SizedBox(
      height: 1100,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color(0xFF3f6db8),
                width: 1400.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.current.essenceTitleMobile.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF19FFFE),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          8.hSpace,
                          Text(
                            S.current.essenceContent1,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              height: 1.3.wMax,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    24.hSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.current.saleRole,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          12.hSpace,
                          ...List.generate(
                            sales.length,
                            (index) {
                              final sale = sales[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  sale,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    8.hSpace,
                    const Divider(
                      indent: 16,
                      endIndent: 120,
                      color: Colors.white,
                      thickness: 2,
                    ),
                    8.hSpace,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            S.current.otherRole,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          12.hSpace,
                          ...List.generate(
                            others.length,
                            (index) {
                              final other = others[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  other,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    16.hSpace,
                    Text(
                      S.current.winningAttribute,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFFf1feff),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    16.hSpace,
                    SizedBox(
                      height: 450,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              1400.w.wSpace,
                              Assets.images.essence.mobileModel.image(
                                width: 200,
                              ),
                              Positioned(
                                top: 20,
                                left: 25,
                                child: WinningAttributeWidget(
                                  title: S.current.adaptability,
                                ),
                              ),
                              Positioned(
                                top: 100,
                                left: 50,
                                child: WinningAttributeWidget(
                                  title: S.current.learningAgility,
                                ),
                              ),
                              Positioned(
                                top: 240,
                                left: 30,
                                child: WinningAttributeWidget(
                                  title: S.current.teamPlayer,
                                ),
                              ),
                              Positioned(
                                top: 30,
                                right: 10,
                                child: WinningAttributeWidget(
                                  title: S.current.resilence,
                                ),
                              ),
                              Positioned(
                                top: 100,
                                right: 30,
                                child: WinningAttributeWidget(
                                  title: S.current.growthMindset,
                                ),
                              ),
                              Positioned(
                                top: 180,
                                right: 5,
                                child: WinningAttributeWidget(
                                  title: S.current.accountability,
                                ),
                              ),
                              Positioned(
                                top: 270,
                                right: 35,
                                child: WinningAttributeWidget(
                                  title: S.current.resultOrientation,
                                ),
                              ),

                              // ...[
                              //   S.current.adaptability,
                              //   S.current.learningAgility,
                              //   S.current.teamPlayer,
                              //   S.current.resilence,
                              //   S.current.growthMindset,
                              //   S.current.accountability,
                              //   S.current.resultOrientation,
                              // ].asMap().entries.map(
                              //       (e) => Positioned(
                              //         top: e.key % 2 == 0 ? 80 * (e.key / 2) : (80 * (e.key / 2)),
                              //         left: e.key % 2 == 0 ? 24 + Random().nextInt(44).toDouble() : null,
                              //         right: e.key % 2 == 1 ? 24 + Random().nextInt(44).toDouble() : null,
                              //         child: WinningAttributeWidget(title: e.value),
                              //       ),
                              //     ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              LocaleUtility.locale.value.languageCode == 'en'
                                  ? Assets.images.essence.en2.image(
                                      width: 1400.w,
                                      fit: BoxFit.fitWidth,
                                    )
                                  : Assets.images.essence.vi2.image(
                                      width: 1400.w,
                                      fit: BoxFit.fitWidth,
                                    ),
                              Positioned(
                                bottom: 25,
                                right: 10,
                                left: 10,
                                child: Text(
                                  S.current.functionalSkillsTextMobile,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFFfe6a00),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    16.hSpace,
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
