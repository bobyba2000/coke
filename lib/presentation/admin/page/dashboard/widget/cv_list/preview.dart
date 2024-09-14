import 'package:coke_platform/common/extension/datetime_extension.dart';
import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:coke_platform/service/firebase/contestant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewContestantDialog extends StatelessWidget {
  final ContestantModel contestant;
  final VoidCallback onDelete;
  const PreviewContestantDialog({
    super.key,
    required this.contestant,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: const EdgeInsets.all(0),
      actions: [
        if (AppDependencies.injector.get<FirebaseAuthService>().getUserEmail() == 'bobyba20@gmail.com')
          TextButton(
            onPressed: () {
              AppDependencies.injector.get<FirebaseContestantService>().delete(contestant).then((value) {
                Navigator.pop(context);
                onDelete.call();
              });
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        width: 800,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(
                builder: (context) {
                  final personal = contestant.personalInfo;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'I/ ${S.current.personalInformation}',
                              style: textTheme.displayLarge?.copyWith(
                                color: colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Text(
                            'Total Point: ${contestant.personalPoint.toUIString()}',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onBackground.withOpacity(0.5),
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      16.hSpace,
                      Wrap(
                        spacing: 16.h,
                        runSpacing: 16.w,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          data(
                            context,
                            S.current.fullName,
                            personal.fullName,
                          ),
                          data(
                            context,
                            S.current.email,
                            personal.email,
                          ),
                          data(
                            context,
                            S.current.yearOfBirth,
                            personal.yearOfBirth.toString(),
                          ),
                          data(
                            context,
                            S.current.phoneNumber,
                            personal.phoneNo,
                          ),
                          data(
                            context,
                            S.current.homeTown,
                            personal.hometown.toString(),
                          ),
                          data(
                            context,
                            S.current.currentLivingLocation,
                            personal.currentLocation.toString(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              24.hSpace,
              Builder(
                builder: (context) {
                  final education = contestant.educationInfo;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'II/ ${S.current.educationBackground}',
                              style: textTheme.displayLarge?.copyWith(
                                color: colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Text(
                            'Total Point: ${contestant.educationPoint.toUIString()}',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onBackground.withOpacity(0.5),
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      16.hSpace,
                      Wrap(
                        spacing: 16.h,
                        runSpacing: 16.w,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          data(
                            context,
                            S.current.educationLevel,
                            education.education.toString(),
                          ),
                          data(
                            context,
                            S.current.graduationYear,
                            education.graduationYear.toUIDateString,
                          ),
                          data(
                            context,
                            S.current.university,
                            education.university,
                          ),
                          data(
                            context,
                            S.current.major,
                            education.major.toString(),
                          ),
                          data(
                            context,
                            S.current.gpa,
                            education.gpa.toString(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              24.hSpace,
              Builder(
                builder: (context) {
                  final career = contestant.careerInfo;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'III/ ${S.current.careerAspiration}',
                              style: textTheme.displayLarge?.copyWith(
                                color: colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Text(
                            'Total Point: ${contestant.careerPoint.toUIString()}',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onBackground.withOpacity(0.5),
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      16.hSpace,
                      Wrap(
                        spacing: 16.h,
                        runSpacing: 16.w,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          data(
                            context,
                            S.current.internshipRole,
                            career.desiredPathway.role.toString(),
                          ),
                          data(
                            context,
                            S.current.priority1,
                            career.desiredPathway.location.first.toString(),
                          ),
                          if (career.desiredPathway.location.second != null)
                            data(
                              context,
                              S.current.priority2,
                              career.desiredPathway.location.second.toString(),
                            ),
                          if (career.desiredPathway.location.willingToChange != null)
                            data(
                              context,
                              S.current.willingToRelocate,
                              career.desiredPathway.location.willingToChange == true ? S.current.yes : S.current.no,
                            ),
                          data(
                            context,
                            S.current.yourAvailability,
                            career.availability.type.toString(),
                          ),
                          data(
                            context,
                            S.current.note,
                            career.availability.note ?? '',
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              24.hSpace,
              Builder(
                builder: (context) {
                  final exhibition = contestant.exhibition;
                  List<Widget> achivements = [];
                  List<Widget> skills = [];
                  List<Widget> experiences = [];
                  for (var experience in exhibition.experiences) {
                    final index = exhibition.experiences.indexOf(experience);
                    experiences.addAll(
                      [
                        if (index != 0)
                          const Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            '${S.current.workingExperience} ${index + 1}',
                            style: textTheme.displaySmall?.copyWith(
                              color: Colors.black,
                              fontSize: 18.spMax,
                            ),
                          ),
                        ),
                        data(
                          context,
                          '${S.current.companyName} ${index + 1}',
                          experience.companyName,
                        ),
                        data(
                          context,
                          S.current.industry,
                          experience.industry.toString(),
                        ),
                        if (experience.startDate != null)
                          data(
                            context,
                            S.current.fromDate,
                            experience.startDate!.toUIDateString,
                          ),
                        if (experience.endDate != null)
                          data(
                            context,
                            S.current.toDate,
                            experience.endDate!.toUIDateString,
                          ),
                        data(
                          context,
                          S.current.workingType,
                          experience.type.toString(),
                        ),
                        data(
                          context,
                          S.current.jobTitle,
                          experience.jobTitle.toString(),
                        ),
                      ],
                    );
                  }
                  for (var skill in exhibition.skills) {
                    final index = exhibition.skills.indexOf(skill);
                    if (index != 0) {
                      skills.add(
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      );
                    }
                    skills.add(
                      data(
                        context,
                        '${S.current.skill} ${index + 1}',
                        skill.skill.toString(),
                      ),
                    );
                    skills.add(
                      data(
                        context,
                        S.current.description,
                        skill.description,
                      ),
                    );
                  }
                  for (var achivement in exhibition.achivements) {
                    final index = exhibition.achivements.indexOf(achivement);
                    if (index != 0) {
                      achivements.add(
                        const Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      );
                    }
                    achivements.add(
                      data(
                        context,
                        '${S.current.achivement} ${index + 1}',
                        achivement.name,
                      ),
                    );
                    achivements.add(
                      data(
                        context,
                        S.current.accomplishment,
                        achivement.accomplishment,
                      ),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'IV/ ${S.current.profileExhibition}',
                              style: textTheme.displayLarge?.copyWith(
                                color: colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Text(
                            'Total Point: ${contestant.exhibitionPoint.toUIString()}',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onBackground.withOpacity(0.5),
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      24.hSpace,
                      Text(
                        S.current.skill.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.spMax,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      12.hSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 16.h,
                          runSpacing: 16.w,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: skills,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 48,
                      ),
                      Text(
                        S.current.achivement.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.spMax,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      12.hSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 16.h,
                          runSpacing: 16.w,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: achivements,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 48,
                      ),
                      Text(
                        S.current.workingExperience.toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.spMax,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      12.hSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 16.h,
                          runSpacing: 16.w,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: experiences,
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 48,
                      ),
                      if (exhibition.english != null)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.current.english.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20.spMax,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            12.hSpace,
                            Wrap(
                              spacing: 16.h,
                              runSpacing: 16.w,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                data(
                                  context,
                                  S.current.englishCertification,
                                  exhibition.english!.certification.toString(),
                                ),
                                data(
                                  context,
                                  S.current.detail,
                                  exhibition.english!.detail.toString(),
                                )
                              ],
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
              24.hSpace,
              Builder(
                builder: (context) {
                  final attachment = contestant.attachment;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'V/ ${S.current.attachment}',
                              style: textTheme.displayLarge?.copyWith(
                                color: colorScheme.onBackground,
                              ),
                            ),
                          ),
                          Text(
                            'Total Point: ${contestant.attachmentPoint.toUIString()}',
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onBackground.withOpacity(0.5),
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                      16.hSpace,
                      Row(
                        children: [
                          Text(S.current.personalResume),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              launchUrl(Uri.parse(attachment.resumeCV));
                            },
                            child: Text(
                              S.current.download,
                            ),
                          ),
                        ],
                      ),
                      16.hSpace,
                      if (attachment.accomplishment != null)
                        Row(
                          children: [
                            Text(S.current.accomplishment),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                launchUrl(Uri.parse(attachment.accomplishment!));
                              },
                              child: Text(
                                S.current.download,
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget data(
    BuildContext context,
    String title,
    String content, {
    double? width,
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      width: width,
      constraints: BoxConstraints(
        minWidth: 400.w,
      ),
      child: SelectableText.rich(
        TextSpan(
          text: '$title: ',
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: content,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
