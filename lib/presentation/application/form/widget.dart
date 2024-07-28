import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:coke_platform/model/firebase/contestant/education/model.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:coke_platform/model/firebase/contestant/personal/model.dart';
import 'package:coke_platform/presentation/application/form/career/widget.dart';
import 'package:coke_platform/presentation/application/form/education/widget.dart';
import 'package:coke_platform/presentation/application/form/exhibition/widget.dart';
import 'package:coke_platform/presentation/application/form/personal/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ApplyStep {
  personal,
  education,
  career,
  exhibition,
  attachment,
  review;

  @override
  String toString() {
    switch (this) {
      case ApplyStep.personal:
        return S.current.personalInformation;
      case ApplyStep.education:
        return S.current.educationBackground;
      case ApplyStep.career:
        return S.current.careerAspiration;
      case ApplyStep.exhibition:
        return S.current.profileExhibition;
      case ApplyStep.attachment:
        return S.current.attachment;
      case ApplyStep.review:
        return S.current.review;
    }
  }

  double get step {
    switch (this) {
      case ApplyStep.personal:
        return 0.125;
      case ApplyStep.education:
        return 0.275;
      case ApplyStep.career:
        return 0.425;
      case ApplyStep.exhibition:
        return 0.575;
      case ApplyStep.attachment:
        return 0.725;
      case ApplyStep.review:
        return 0.1;
    }
  }

  double get position {
    switch (this) {
      case ApplyStep.personal:
        return 0.125;
      case ApplyStep.education:
        return 0.275;
      case ApplyStep.career:
        return 0.425;
      case ApplyStep.exhibition:
        return 0.575;
      case ApplyStep.attachment:
        return 0.725;
      case ApplyStep.review:
        return 0.875;
    }
  }

  Widget form(Function(dynamic value) onFinish) {
    switch (this) {
      case ApplyStep.personal:
        return PersonalInformationWidget(onFinish: onFinish);
      case ApplyStep.education:
        return EducationInfoWidget(onFinish: onFinish);
      case ApplyStep.career:
        return CareerInfoWidget(onFinish: onFinish);
      case ApplyStep.exhibition:
        return ProfileExhibitionWidget(onFinish: onFinish);
      case ApplyStep.attachment:
        return Container();
      case ApplyStep.review:
        return Container();
    }
  }
}

class ApplyFormWidget extends StatefulWidget {
  const ApplyFormWidget({super.key});

  @override
  State<ApplyFormWidget> createState() => _ApplyFormWidgetState();
}

class _ApplyFormWidgetState extends State<ApplyFormWidget> {
  ApplyStep step = ApplyStep.personal;
  PersonalInfoModel? personal;
  EducationInfoModel? education;
  CareerInfoModel? career;
  ExhibitionInfoModel? exhibition;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Container(
      width: 1100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.dividerColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 64.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              LinearProgressIndicator(
                value: step.step,
                color: colorScheme.primary,
                minHeight: 10.w,
                backgroundColor: const Color(0xFFe9ecef),
                borderRadius: BorderRadius.circular(5),
              ),
              ...ApplyStep.values.map(
                (e) => Positioned(
                  left: e.position * 972.w - 20.w,
                  child: Tooltip(
                    message: e.toString(),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    textStyle: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Container(
                        width: 16.w,
                        height: 16.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),
                          color: e.index > step.index ? const Color(0xFFe9ecef) : colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          64.hMax.hSpace,
          step.form(
            (value) {
              switch (step) {
                case ApplyStep.personal:
                  personal = value;
                  step = ApplyStep.education;
                  break;
                case ApplyStep.education:
                  education = value;
                  step = ApplyStep.career;
                  break;
                case ApplyStep.career:
                  career = value;
                  step = ApplyStep.exhibition;
                  break;
                case ApplyStep.exhibition:
                  exhibition = value;
                  step = ApplyStep.attachment;
                  break;
                case ApplyStep.attachment:
                  step = ApplyStep.review;
                  break;
                case ApplyStep.review:
                  break;
              }
              if (mounted) {
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
