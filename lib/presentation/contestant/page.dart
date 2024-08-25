// ignore_for_file: use_build_context_synchronously

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/loading_utility.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

enum ContestantStatus {
  onlineApplication,
  onlineAssessment,
  launchPadDay,
  onboarding;

  @override
  String toString() {
    switch (this) {
      case ContestantStatus.onlineApplication:
        return S.current.onlineApplicationTitle;
      case ContestantStatus.onlineAssessment:
        return S.current.onlineAssessmentTitle;
      case ContestantStatus.launchPadDay:
        return S.current.launchPadDayTitle;
      case ContestantStatus.onboarding:
        return S.current.onboardingTitle;
    }
  }

  double get step {
    switch (this) {
      case ContestantStatus.onlineApplication:
        return 0.2;
      case ContestantStatus.onlineAssessment:
        return 0.4;
      case ContestantStatus.launchPadDay:
        return 0.6;
      case ContestantStatus.onboarding:
        return 1;
    }
  }

  double get position {
    switch (this) {
      case ContestantStatus.onlineApplication:
        return 0.2;
      case ContestantStatus.onlineAssessment:
        return 0.4;
      case ContestantStatus.launchPadDay:
        return 0.6;
      case ContestantStatus.onboarding:
        return 0.8;
    }
  }
}

class ContestantPage extends StatefulWidget {
  const ContestantPage({super.key});

  @override
  State<ContestantPage> createState() => _ContestantPageState();
}

class _ContestantPageState extends State<ContestantPage> {
  final service = AppDependencies.injector.get<FirebaseAuthService>();
  ContestantStatus currentStep = ContestantStatus.onlineApplication;
  bool showStatus = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Title(
      color: Colors.white,
      title: 'Your info',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Assets.images.header.image(
                          width: 1400.w,
                          fit: BoxFit.fitWidth,
                        ),
                        Positioned(
                          right: 40.w,
                          top: 10.w,
                          child: const LanguageSwitch(),
                        )
                      ],
                    ),
                    36.hSpace,
                    Text(
                      S.current.personalProfile.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24.spMin,
                        color: ColorConstants.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    24.hSpace,
                    Container(
                      width: 800.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: ColorConstants.teal,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 64.w,
                        vertical: 40.h,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            service.getUserName()!.toUpperCase(),
                            style: TextStyle(
                              fontSize: 20.spMin,
                              color: ColorConstants.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          4.hSpace,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.arrow_forward,
                                color: ColorConstants.teal,
                                size: 12,
                              ),
                              16.wSpace,
                              Text(
                                S.current.contestant,
                                style: TextStyle(
                                  fontSize: 14.spMin,
                                ),
                              ),
                              16.wSpace,
                              const Icon(
                                Icons.arrow_back,
                                color: ColorConstants.teal,
                                size: 12,
                              ),
                            ],
                          ),
                          30.hSpace,
                          Visibility(
                            visible: showStatus,
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: 64.hMax,
                                top: 40,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  LinearProgressIndicator(
                                    value: currentStep.step,
                                    color: ColorConstants.teal,
                                    minHeight: 10.w,
                                    backgroundColor: const Color(0xFFe9ecef),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  ...ContestantStatus.values.map(
                                    (e) => Positioned(
                                      left: e.position * 672.w - 20.w - (e.toString().length / 2) * 6.spMin,
                                      child: Column(
                                        children: [
                                          Text(
                                            e.toString(),
                                            style: textTheme.bodyLarge?.copyWith(
                                              color: e.index % 2 == 0
                                                  ? e.index <= currentStep.index
                                                      ? ColorConstants.teal
                                                      : Colors.grey
                                                  : Colors.transparent,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          8.hSpace,
                                          Container(
                                            width: 20.w,
                                            height: 20.w,
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 16.w,
                                              height: 16.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16.w),
                                                color: e.index > currentStep.index ? const Color(0xFFe9ecef) : ColorConstants.teal,
                                              ),
                                            ),
                                          ),
                                          8.hSpace,
                                          Text(
                                            e.toString(),
                                            style: textTheme.bodyLarge?.copyWith(
                                              color: e.index % 2 != 0
                                                  ? e.index <= currentStep.index
                                                      ? ColorConstants.teal
                                                      : Colors.grey
                                                  : Colors.transparent,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: 400.w,
                          //   child: Text(
                          //     '${S.current.hello}${service.getUserName()}',
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //       color: ColorConstants.teal,
                          //       fontSize: 24.sp,
                          //     ),
                          //   ),
                          // ),
                          // 8.hSpace,
                          SizedBox(
                            width: 400.w,
                            child: CustomFilledButton(
                              color: ColorConstants.teal,
                              title: S.current.viewApplicationStatus,
                              onTap: () {
                                setState(() {
                                  showStatus = true;
                                });
                              },
                            ),
                          ),
                          16.hSpace,
                          SizedBox(
                            width: 400.w,
                            child: CustomFilledButton(
                              color: ColorConstants.teal,
                              title: S.current.changePassword,
                              onTap: () => changePassword(context),
                            ),
                          ),
                          16.hSpace,
                          SizedBox(
                            width: 400.w,
                            child: CustomFilledButton(
                              title: S.current.signOut,
                              onTap: () => logout(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    64.hMax.hSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logout(BuildContext context) {
    final authService = AppDependencies.injector.get<FirebaseAuthService>();
    authService.logout().then((value) {
      context.go('/login');
    });
  }

  void changePassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          final form = GlobalKey<FormState>();
          String password = '';
          return AlertDialog(
            title: Text(
              S.current.changePassword,
              style: TextStyle(fontSize: 26.sp, color: Colors.red),
            ),
            content: SizedBox(
              width: 600.w,
              child: Form(
                key: form,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFieldWidget(
                      label: S.current.newPassword,
                      fillColor: Colors.white,
                      filled: true,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    24.hSpace,
                    TextFieldWidget(
                      label: S.current.confirmPassword,
                      fillColor: Colors.white,
                      filled: true,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value == '') {
                          return S.current.inputRequired;
                        }
                        if (value != password) {
                          return 'Your confirm password is not correct';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.current.cancel),
              ),
              TextButton(
                onPressed: () async {
                  if (form.currentState!.validate()) {
                    final authService = AppDependencies.injector.get<FirebaseAuthService>();
                    LoadingUtility.show();
                    try {
                      await authService.changePassword(password);
                      Navigator.pop(context);
                    } catch (e) {
                      Logger().e(e);
                    } finally {
                      LoadingUtility.dismiss();
                    }
                  }
                },
                child: Text(
                  S.current.confirm,
                ),
              ),
            ],
          );
        });
  }
}
