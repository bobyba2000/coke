import 'package:coke_platform/common/extension/datetime_extension.dart';
import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewContestantDialog extends StatelessWidget {
  final ContestantModel contestant;
  const PreviewContestantDialog({
    super.key,
    required this.contestant,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.all(0),
      actionsPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titlePadding: const EdgeInsets.all(0),
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
                            'Total Point: ${contestant.personalPoint}',
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
                            personal.hometown,
                          ),
                          data(
                            context,
                            S.current.currentLivingLocation,
                            personal.currentLocation,
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
                            'Total Point: ${contestant.educationPoint}',
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
                            'Total Point: ${contestant.careerPoint}',
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
                            'Total Point: ${contestant.exhibitionPoint}',
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
                        children: skills,
                      ),
                      16.hSpace,
                      Wrap(
                        spacing: 16.h,
                        runSpacing: 16.w,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: achivements,
                      ),
                      16.hSpace,
                      if (exhibition.english != null)
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
                      16.hSpace,
                      Wrap(
                        spacing: 16.h,
                        runSpacing: 16.w,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: experiences,
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
                            'Total Point: ${contestant.attachmentPoint}',
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

  Widget data(BuildContext context, String title, String content) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      constraints: BoxConstraints(
        minWidth: 400.w,
      ),
      child: RichText(
        text: TextSpan(
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
