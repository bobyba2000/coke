import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/presentation/admin/page/dashboard/widget/overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coke_platform/model/firebase/contestant/attachment/model.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:coke_platform/model/firebase/contestant/education/model.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:coke_platform/model/firebase/contestant/personal/model.dart';

import 'widget/cv_list/widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<ContestantModel> datas = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    List<ContestantModel> contestants = List.generate(30, (index) => generateContestant(index));
    datas = contestants;
    if (mounted) {
      setState(() {});
    }
  }

  ContestantModel generateContestant(int index) {
    return ContestantModel(
      personalInfo: generatePersonalInfo(index),
      educationInfo: generateEducationInfo(index),
      careerInfo: generateCareerInfo(),
      exhibition: generateExhibitionInfo(),
      attachment: generateAttachment(),
    );
  }

  PersonalInfoModel generatePersonalInfo(int index) {
    return PersonalInfoModel(
      fullName: 'Full Name $index',
      yearOfBirth: 2000 + index % 10,
      email: 'email$index@example.com',
      phoneNo: '123-456-789$index',
      hometown: 'Hometown $index',
      currentLocation: 'Current Location $index',
    );
  }

  EducationInfoModel generateEducationInfo(int index) {
    return EducationInfoModel(
      education: EducationLevel.bachelor,
      graduationYear: GraduationYear.before2024,
      university: 'HCMUS',
      major: 'IT',
      gpa: 8,
    );
  }

  CareerInfoModel generateCareerInfo() {
    return CareerInfoModel(
      desiredPathway: DesiredPathwayModel(
        role: InternshipRole.sales, // Assuming a default value
        location: WorkingLocationModel(
          first: 'City A',
          second: 'City B',
          willingToChange: true,
        ),
      ),
      availability: AvailabilityModel(
        type: AvailabilityType.fulltime6Months,
        note: 'Available for 6 months full-time',
      ),
    );
  }

  ExhibitionInfoModel generateExhibitionInfo() {
    return ExhibitionInfoModel(
      achivement: AchivementModel(
        name: 'Achievement Name',
        accomplishment: 'Description of accomplishment',
      ),
      skills: [
        SkillModel(
          skill: 'Skill 1',
          description: 'Description of skill 1',
        ),
        SkillModel(
          skill: 'Skill 2',
          description: 'Description of skill 2',
        ),
      ],
      experiences: [
        WorkingExperienceModel(
          type: WorkingType.partTime,
          startDate: DateTime(2022, 1, 1),
          endDate: DateTime(2023, 1, 1),
          industry: CompanyIndustry.itSoftware,
          companyName: 'Company Name',
          jobTitle: 'Job Title',
        ),
      ],
      english: EnglishProfiencyModel(
        certification: EnglistCertification.ielts,
        detail: 'IELTS 7.5',
      ),
    );
  }

  AttachmentModel generateAttachment() {
    return AttachmentModel(
      resumeCV: 'link_to_resume_cv',
      accomplishment: 'link_to_accomplishment',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.hSpace,
            SizedBox(
              width: 330.w,
              child: OverviewWidget(totalCVs: datas.length),
            ),
            16.hSpace,
            CVListWidget(
              contestants: datas,
            ),
          ],
        ),
      ),
    );
  }
}
