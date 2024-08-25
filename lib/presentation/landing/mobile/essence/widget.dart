import 'dart:math';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final isEnglish = LocaleUtility.locale.value.languageCode == 'en';
    return Container(
      color: const Color(0xFFf1feff),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: const Color(0xFF3f6db8),
                width: 1400.w,
                margin: const EdgeInsets.only(bottom: 80),
                padding: const EdgeInsets.only(bottom: 80),
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
                    36.hSpace,
                    isEnglish
                        ? Assets.images.essence.winningMobile.image(
                            height: 175,
                            fit: BoxFit.fitWidth,
                          )
                        : Assets.images.essence.winningMobileVi.image(
                            height: 175,
                            fit: BoxFit.fitWidth,
                          ),
                    SizedBox(
                      height: 440,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              20.wSpace,
                              Assets.images.essence.mobileModel.image(
                                height: 300,
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          ),
                          Positioned(
                            top: 150,
                            child: isEnglish
                                ? Assets.images.essence.mobileSale.image(
                                    width: 1400.w,
                                  )
                                : Assets.images.essence.mobileSaleVi.image(width: 1400.w),
                          ),
                        ],
                      ),
                    ),
                    12.hSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        sales.length,
                        (index) {
                          final sale = sales[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              left: 40,
                              right: 16,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Icon(
                                    Icons.circle,
                                    color: Colors.white,
                                    size: 6,
                                  ),
                                ),
                                8.wSpace,
                                Expanded(
                                  child: Text(
                                    sale,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    4.hSpace,
                    Stack(
                      children: [
                        Container(
                          height: 300,
                          alignment: Alignment.topCenter,
                          child: isEnglish
                              ? Assets.images.essence.mobileNonsale.image(
                                  width: 1400.w,
                                )
                              : Assets.images.essence.mobileNonsaleVi.image(
                                  width: 1400.w,
                                ),
                        ),
                        Positioned(
                          top: 150,
                          left: 0,
                          right: 24,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              sales.length,
                              (index) {
                                final other = others[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                    left: 40,
                                    right: 16,
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 4),
                                        child: Icon(
                                          Icons.circle,
                                          color: Colors.white,
                                          size: 6,
                                        ),
                                      ),
                                      8.wSpace,
                                      Expanded(
                                        child: Text(
                                          other,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    LocaleUtility.locale.value.languageCode == 'en'
                        ? Assets.images.essence.en2Mobile.image(
                            width: 1400.w,
                            fit: BoxFit.fitWidth,
                          )
                        : Assets.images.essence.vi2Mobile.image(
                            width: 1400.w,
                            fit: BoxFit.fitWidth,
                          ),
                    Positioned(
                      bottom: 30,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
