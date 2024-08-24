import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
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
      padding: const EdgeInsets.all(52),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
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
      height: 1880,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFFf1feff),
              child: Assets.images.essence.bottom.image(),
            ),
          ),
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
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      8.hSpace,
                      Text(
                        S.current.essenceContent1,
                        style: TextStyle(
                          fontSize: 16,
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
                          fontSize: 24,
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
                                fontSize: 16,
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
                          fontSize: 24,
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
                                fontSize: 16,
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
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.hSpace,
                SizedBox(
                  height: 1000,
                  child: Stack(
                    children: [
                      ...[
                        S.current.integrity,
                        S.current.eagerToLearn,
                        S.current.adaptability,
                        S.current.learningAgility,
                        S.current.teamPlayer,
                        S.current.resilence,
                        S.current.growthMindset,
                        S.current.accountability,
                        S.current.resultOrientation,
                      ].asMap().entries.map(
                            (e) => Positioned(
                              top: e.key % 2 == 0 ? 200 * (e.key / 2) : (200 * (e.key / 2)),
                              left: e.key % 2 == 0 ? 16 + Random().nextInt(44).toDouble() : null,
                              right: e.key % 2 == 1 ? 16 + Random().nextInt(44).toDouble() : null,
                              child: WinningAttributeWidget(title: e.value),
                            ),
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
    );
  }
}
