import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/presentation/admin/page/dashboard/widget/overview.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:coke_platform/service/firebase/contestant.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

import 'widget/cv_list/preview.dart';
import 'widget/cv_list/widget.dart';

class DashboardPage extends StatefulWidget {
  final String? contestantKey;
  const DashboardPage({super.key, this.contestantKey});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<ContestantModel> datas = [];
  final contestantService = AppDependencies.injector.get<FirebaseContestantService>();
  String textSearch = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    contestantService.list().then(
      (value) {
        datas = value;
        if (mounted) {
          setState(() {});
        }
        if (widget.contestantKey != null) {
          final contestant = datas.firstWhereOrNull((element) => element.key == widget.contestantKey);
          if (contestant == null) {
            return;
          } else {
            showDialog(
              context: context,
              builder: (context) => PreviewContestantDialog(
                contestant: contestant,
                onDelete: () => getData(),
              ),
            );
          }
        }
      },
    ).onError((error, stackTrace) {
      Logger().e(error);
    });
  }

  // ContestantModel generateContestant(int index) {
  //   return ContestantModel(
  //     personalInfo: generatePersonalInfo(index),
  //     educationInfo: generateEducationInfo(index),
  //     careerInfo: generateCareerInfo(index),
  //     exhibition: generateExhibitionInfo(index),
  //     attachment: generateAttachment(),
  //   );
  // }

  // PersonalInfoModel generatePersonalInfo(int index) {
  //   return PersonalInfoModel(
  //     fullName: 'Full Name $index',
  //     yearOfBirth: 2000 + index % 10,
  //     email: 'email$index@example.com',
  //     phoneNo: '123-456-789$index',
  //     hometown: 'Hometown $index',
  //     currentLocation: 'Current Location $index',
  //   );
  // }

  // EducationInfoModel generateEducationInfo(int index) {
  //   return EducationInfoModel(
  //     education: EducationLevel.values[index % EducationLevel.values.length],
  //     graduationYear: GraduationYear.values[index % GraduationYear.values.length],
  //     university: 'HCMUS',
  //     major: 'IT',
  //     gpa: 8,
  //   );
  // }

  // CareerInfoModel generateCareerInfo(int index) {
  //   return CareerInfoModel(
  //     desiredPathway: DesiredPathwayModel(
  //       role: InternshipRole.values[index % InternshipRole.values.length],
  //       location: WorkingLocationModel(
  //         first: 'City A',
  //         second: 'City B',
  //         willingToChange: true,
  //       ),
  //     ),
  //     availability: AvailabilityModel(
  //       type: AvailabilityType.fulltime6Months,
  //       note: 'Available for 6 months full-time',
  //     ),
  //   );
  // }

  // ExhibitionInfoModel generateExhibitionInfo(int index) {
  //   return ExhibitionInfoModel(
  //     achivements: [
  //       AchivementModel(
  //         name: 'Achievement Name',
  //         accomplishment: 'Description of accomplishment',
  //       ),
  //     ],
  //     skills: [
  //       SkillModel(
  //         skill: 'Skill 1',
  //         description: 'Description of skill 1',
  //       ),
  //       SkillModel(
  //         skill: 'Skill 2',
  //         description: 'Description of skill 2',
  //       ),
  //     ],
  //     experiences: [
  //       WorkingExperienceModel(
  //         type: WorkingType.values[index % WorkingType.values.length],
  //         startDate: DateTime(2022, 1, 1),
  //         endDate: DateTime(2023, 1, 1),
  //         industry: CompanyIndustry.values[index % CompanyIndustry.values.length].toString(),
  //         companyName: 'Company Name',
  //         jobTitle: 'Job Title',
  //       ),
  //     ],
  //     english: EnglishProfiencyModel(
  //       certification: EnglistCertification.values[index % EnglistCertification.values.length],
  //       detail: 'IELTS 7.5',
  //     ),
  //   );
  // }

  // AttachmentModel generateAttachment() {
  //   return AttachmentModel(
  //     resumeCV: 'link_to_resume_cv',
  //     accomplishment: 'link_to_accomplishment',
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final viewData = datas
        .where(
          (e) => e.toString().toLowerCase().contains(
                textSearch.toLowerCase(),
              ),
        )
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 10),
      child: Column(
        children: [
          AppDependencies.injector.get<FirebaseAuthService>().getUserEmail() == 'bobyba20@gmail.com'
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.hSpace,
                    TextFieldWidget(
                      hintText: 'Search Contestant',
                      onFieldSubmitted: (value) {
                        textSearch = value;
                        setState(() {});
                      },
                    ),
                    20.hSpace,
                  ],
                )
              : 20.hSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverviewWidget(contestants: datas),
                  16.hSpace,
                  CVListWidget(
                    contestants: viewData,
                    onDelete: () {
                      getData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
