// ignore_for_file: use_build_context_synchronously

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/common/utility/loading_utility.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/constants/firebase_path.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/attachment/model.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:coke_platform/model/firebase/contestant/education/model.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:coke_platform/model/firebase/contestant/personal/model.dart';
import 'package:coke_platform/presentation/application/form/attachment/widget.dart';
import 'package:coke_platform/service/firebase/contestant.dart';
import 'package:coke_platform/service/firebase/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PersonalPreview extends StatefulWidget {
  final VoidCallback onBack;
  final PersonalInfoModel personal;
  final EducationInfoModel education;
  final CareerInfoModel career;
  final ExhibitionInfoModel exhibition;
  final AttachmentViewModel attachment;
  const PersonalPreview({
    super.key,
    required this.personal,
    required this.education,
    required this.career,
    required this.exhibition,
    required this.attachment,
    required this.onBack,
  });

  @override
  State<PersonalPreview> createState() => _PersonalPreviewState();
}

class _PersonalPreviewState extends State<PersonalPreview> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              final personal = widget.personal;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I/ ${S.current.personalInformation}',
                    style: textTheme.displayLarge?.copyWith(
                      color: colorScheme.onBackground,
                    ),
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
              final education = widget.education;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'II/ ${S.current.educationBackground}',
                    style: textTheme.displayLarge?.copyWith(
                      color: colorScheme.onBackground,
                    ),
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
                        education.graduationYear.toString(),
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
              final career = widget.career;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'III/ ${S.current.careerAspiration}',
                    style: textTheme.displayLarge?.copyWith(
                      color: colorScheme.onBackground,
                    ),
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
                        career.availability.note?.toString() ?? '',
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
              final exhibition = widget.exhibition;
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
                        DateFormat('dd/MM/yyyy').format(experience.startDate!),
                      ),
                    if (experience.endDate != null)
                      data(
                        context,
                        S.current.toDate,
                        DateFormat('dd/MM/yyyy').format(experience.endDate!),
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
                    skill.skill,
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
                  Text(
                    'IV/ ${S.current.profileExhibition}',
                    style: textTheme.displayLarge?.copyWith(
                      color: colorScheme.onBackground,
                    ),
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
              final attachment = widget.attachment;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'V/ ${S.current.attachment}',
                    style: textTheme.displayLarge?.copyWith(
                      color: colorScheme.onBackground,
                    ),
                  ),
                  16.hSpace,
                  Text(
                    S.current.personalResume,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  8.hSpace,
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      attachment.resume.fileName,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              );
            },
          ),
          64.h.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOutlinedButton(
                title: S.current.back,
                color: Colors.black,
                onTap: () {
                  widget.onBack.call();
                },
              ),
              16.wSpace,
              CustomOutlinedButton(
                title: S.current.submit,
                onTap: () async {
                  final storageService = AppDependencies.injector.get<FirebaseStorageService>();
                  final contestantService = AppDependencies.injector.get<FirebaseContestantService>();
                  final key = contestantService.generateKey();
                  late String resumeUrl;
                  String? attachmentUrl;
                  try {
                    LoadingUtility.show();
                    await Future.wait(
                      [
                        () async {
                          resumeUrl = await storageService.upload(
                              '${FirebasePath.contestant}/$key/${widget.attachment.resume.fileName}', widget.attachment.resume);
                        }.call(),
                        () async {
                          if (widget.attachment.accomplishment != null) {
                            attachmentUrl = await storageService.upload(
                              '${FirebasePath.contestant}/$key/${widget.attachment.accomplishment!.fileName}',
                              widget.attachment.accomplishment!,
                            );
                          }
                        }.call(),
                      ],
                    );
                    final contestant = ContestantModel(
                      key: key,
                      personalInfo: widget.personal,
                      educationInfo: widget.education,
                      careerInfo: widget.career,
                      exhibition: widget.exhibition,
                      attachment: AttachmentModel(
                        resumeCV: resumeUrl,
                        accomplishment: attachmentUrl,
                      ),
                      submitTime: DateTime.now(),
                    );
                    await contestant.exhibition.calculatePoint(widget.career.desiredPathway.role);
                    await contestantService.update(contestant);
                    DialogUtility.showConfirmDialog(
                      context,
                      title: S.current.thankyou,
                      message: S.current.applySuccessfully,
                      onConfirm: () {
                        Navigator.pop(context);
                      },
                    ).then((value) {
                      context.go('/');
                    });
                  } catch (e) {
                    DialogUtility.showErrorDialog(
                      context,
                      title: S.current.error,
                      message: S.current.unknownError,
                    );
                  } finally {
                    LoadingUtility.dismiss();
                  }
                },
              ),
            ],
          ),
        ],
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
