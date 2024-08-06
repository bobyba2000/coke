import 'package:coke_platform/common/extension/datetime_extension.dart';
import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:coke_platform/presentation/admin/page/dashboard/widget/cv_list/preview.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

enum ColumnTitle {
  submitTime,
  name,
  preferName,
  yearOfBirth,
  email,
  phoneNumber,
  hometown,
  currentLocation,
  educationLevel,
  university,
  major,
  gpa,
  graduationYear,
  internRole,
  workingLocationPriority1,
  workingLocationPriority2,
  willingToChange,
  availabilityType,
  availabilityNote,
  achivement1,
  accomplishment1,
  achivement2,
  accomplishment2,
  skill1,
  skill1Desc,
  skill2,
  skill2Desc,
  skill3,
  skill3Desc,
  skill4,
  skill4Desc,
  skill5,
  skill5Desc,
  experience1Type,
  experience1Company,
  experience1JobTitle,
  experience1StartDate,
  experience1EndDate,
  experience2Type,
  experience2Company,
  experience2JobTitle,
  experience2StartDate,
  experience2EndDate,
  experience3Type,
  experience3Company,
  experience3JobTitle,
  experience3StartDate,
  experience3EndDate,
  english,
  englishDetail,
  resume,
  attachments,
  personalPoint,
  educationLevelPoint,
  majorPoint,
  gpaPoint,
  graduationYearPoint,
  desiredPathwayPoint,
  availabilityPoint,
  achivementPoint1,
  achivementPoint2,
  skillPoint1,
  skillPoint2,
  skillPoint3,
  skillPoint4,
  skillPoint5,
  experiencePoint1,
  experiencePoint2,
  experiencePoint3,
  totalPoint;

  @override
  String toString() {
    switch (this) {
      case name:
        return 'Name';
      case preferName:
        return 'Preferred Name';
      case yearOfBirth:
        return 'Year of Birth';
      case email:
        return 'Email';
      case phoneNumber:
        return 'Phone Number';
      case hometown:
        return 'Hometown';
      case currentLocation:
        return 'Current Location';
      case educationLevel:
        return 'Education Level';
      case university:
        return 'University';
      case major:
        return 'Major';
      case gpa:
        return 'GPA';
      case graduationYear:
        return 'Graduation Year';
      case internRole:
        return 'Intern Role';
      case english:
        return 'English Proficiency';
      case resume:
        return 'Resume';
      case ColumnTitle.totalPoint:
        return 'Total Point';
      case ColumnTitle.workingLocationPriority1:
        return 'Location 1';
      case ColumnTitle.workingLocationPriority2:
        return 'Location 2';
      case ColumnTitle.willingToChange:
        return 'Willing To Change';
      case ColumnTitle.availabilityType:
        return 'Availability Type';
      case ColumnTitle.availabilityNote:
        return 'Availability Note';
      case ColumnTitle.achivement1:
        return 'Achivement 1';
      case ColumnTitle.accomplishment1:
        return 'Accomplishment 1';
      case ColumnTitle.achivement2:
        return 'Achivement 2';
      case ColumnTitle.accomplishment2:
        return 'Accomplishment 2';
      case ColumnTitle.skill1:
        return 'Skill 1';
      case ColumnTitle.skill1Desc:
        return 'Skill 1 Description';
      case ColumnTitle.skill2:
        return 'Skill 2';
      case ColumnTitle.skill2Desc:
        return 'Skill 2 Description';
      case ColumnTitle.skill3:
        return 'Skill 3';
      case ColumnTitle.skill3Desc:
        return 'Skill 2 Description';
      case ColumnTitle.skill4:
        return 'Skill 4';
      case ColumnTitle.skill4Desc:
        return 'Skill 4 Description';
      case ColumnTitle.skill5:
        return 'Skill 5';
      case ColumnTitle.skill5Desc:
        return 'Skill 5 Description';
      case ColumnTitle.experience1Type:
        return 'Working Experience 1 - Type';
      case ColumnTitle.experience1Company:
        return 'Working Experience 1 - Company';
      case ColumnTitle.experience1JobTitle:
        return 'Working Experience 1 - Title';
      case ColumnTitle.experience1StartDate:
        return 'Working Experience 1 - Start Date';
      case ColumnTitle.experience1EndDate:
        return 'Working Experience 1 - End Date';
      case ColumnTitle.experience2Type:
        return 'Working Experience 2 - Type';
      case ColumnTitle.experience2Company:
        return 'Working Experience 2 - Company';
      case ColumnTitle.experience2JobTitle:
        return 'Working Experience 2 - Title';
      case ColumnTitle.experience2StartDate:
        return 'Working Experience 2 - Start Date';
      case ColumnTitle.experience2EndDate:
        return 'Working Experience 2 - End Date';
      case ColumnTitle.experience3Type:
        return 'Working Experience 3 - Type';
      case ColumnTitle.experience3Company:
        return 'Working Experience 3 - Company';
      case ColumnTitle.experience3JobTitle:
        return 'Working Experience 3 - Title';
      case ColumnTitle.experience3StartDate:
        return 'Working Experience 3 - Start Date';
      case ColumnTitle.experience3EndDate:
        return 'Working Experience 3 - End Date';
      case ColumnTitle.submitTime:
        return 'Submit Time';
      case ColumnTitle.englishDetail:
        return 'English - Detail';
      case ColumnTitle.attachments:
        return 'Attachments';
      case ColumnTitle.personalPoint:
        return 'Personal Point';
      case ColumnTitle.educationLevelPoint:
        return 'Education Level Point';
      case ColumnTitle.majorPoint:
        return 'Major Point';
      case ColumnTitle.gpaPoint:
        return 'GPA Point';
      case ColumnTitle.graduationYearPoint:
        return 'Graduation Year Point';
      case ColumnTitle.desiredPathwayPoint:
        return 'Desired Pathway Point';
      case ColumnTitle.availabilityPoint:
        return 'Availability Point';
      case ColumnTitle.achivementPoint1:
        return 'Achivement 1 Point';
      case ColumnTitle.achivementPoint2:
        return 'Achivement 2 Point';
      case ColumnTitle.skillPoint1:
        return 'Skill 1 Point';
      case ColumnTitle.skillPoint2:
        return 'Skill 2 Point';
      case ColumnTitle.skillPoint3:
        return 'Skill 3 Point';
      case ColumnTitle.skillPoint4:
        return 'Skill 4 Point';
      case ColumnTitle.skillPoint5:
        return 'Skill 5 Point';
      case ColumnTitle.experiencePoint1:
        return 'Experience 1 Point';
      case ColumnTitle.experiencePoint2:
        return 'Experience 2 Point';
      case ColumnTitle.experiencePoint3:
        return 'Experience 3 Point';
    }
  }

  double get width {
    switch (this) {
      case ColumnTitle.preferName:
        return 100.wMax;
      case ColumnTitle.name:
        return 200.wMax;
      case ColumnTitle.yearOfBirth:
        return 150.wMax;
      case ColumnTitle.email:
        return 200.wMax;
      case ColumnTitle.phoneNumber:
        return 150.wMax;
      case ColumnTitle.hometown:
        return 300.wMax;
      case ColumnTitle.currentLocation:
        return 300.wMax;
      case ColumnTitle.educationLevel:
        return 200.wMax;
      case ColumnTitle.university:
        return 400.wMax;
      case ColumnTitle.major:
        return 400.wMax;
      case ColumnTitle.gpa:
        return 80.wMax;
      case ColumnTitle.graduationYear:
        return 150.wMax;
      case ColumnTitle.english:
        return 200.wMax;
      case ColumnTitle.resume:
        return 300.wMax;
      case ColumnTitle.totalPoint:
        return 80.wMax;
      case ColumnTitle.internRole:
        return 200.wMax;
      case ColumnTitle.workingLocationPriority1:
        return 200.wMax;
      case ColumnTitle.workingLocationPriority2:
        return 200.wMax;
      case ColumnTitle.willingToChange:
        return 80.wMax;
      case ColumnTitle.availabilityType:
        return 200.wMax;
      case ColumnTitle.availabilityNote:
        return 300.wMax;
      case ColumnTitle.achivement1:
      case ColumnTitle.accomplishment1:
      case ColumnTitle.achivement2:
      case ColumnTitle.accomplishment2:
        return 300.wMax;
      case ColumnTitle.skill1:
      case ColumnTitle.skill2:
      case ColumnTitle.skill3:
      case ColumnTitle.skill4:
      case ColumnTitle.skill5:
        return 300.wMax;
      case ColumnTitle.skill1Desc:
      case ColumnTitle.skill2Desc:
      case ColumnTitle.skill3Desc:
      case ColumnTitle.skill4Desc:
      case ColumnTitle.skill5Desc:
        return 500.wMax;
      case ColumnTitle.personalPoint:
      case ColumnTitle.educationLevelPoint:
      case ColumnTitle.majorPoint:
      case ColumnTitle.gpaPoint:
      case ColumnTitle.graduationYearPoint:
      case ColumnTitle.desiredPathwayPoint:
      case ColumnTitle.availabilityPoint:
      case ColumnTitle.achivementPoint1:
      case ColumnTitle.achivementPoint2:
      case ColumnTitle.skillPoint1:
      case ColumnTitle.skillPoint2:
      case ColumnTitle.skillPoint3:
      case ColumnTitle.skillPoint4:
      case ColumnTitle.skillPoint5:
      case ColumnTitle.experiencePoint1:
      case ColumnTitle.experiencePoint2:
      case ColumnTitle.experiencePoint3:
        return 100.wMax;
      default:
        return 300.wMax;
    }
  }
}

class ListContestantTable extends StatefulWidget {
  final List<ContestantModel> contestants;
  const ListContestantTable({
    super.key,
    required this.contestants,
  });

  @override
  State<ListContestantTable> createState() => _ListContestantTableState();
}

class _ListContestantTableState extends State<ListContestantTable> {
  List<ColumnTitle> titles = ColumnTitle.values;
  final sizePerPage = 10;
  int totalPages = 1;
  int currentPage = 0;

  @override
  void initState() {
    totalPages = (widget.contestants.length / sizePerPage).ceil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final start = (currentPage) * sizePerPage;
    final end = (currentPage + 1) * sizePerPage > widget.contestants.length ? widget.contestants.length : (currentPage + 1) * sizePerPage;
    int fromPage = currentPage - 1;
    int toPage = fromPage + 4;
    if (toPage > totalPages - 1) {
      fromPage = totalPages - 4;
      toPage = totalPages - 1;
    }
    if (fromPage < 0) {
      fromPage = 0;
      toPage = totalPages > 4 ? 4 : totalPages;
    }
    final viewContestants = widget.contestants.sublist(currentPage * sizePerPage, end);
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: titles
                      .map(
                        (e) => TableCellWidget(
                          value: e.toString(),
                          isTitle: true,
                          width: e.width,
                        ),
                      )
                      .toList(),
                ),
                ...viewContestants.asMap().entries.map(
                      (e) => TableRowWidget(
                        contestant: e.value,
                        titles: titles,
                        index: currentPage * sizePerPage + e.key,
                      ),
                    ),
              ],
            ),
          ),
          8.hSpace,
          Row(
            children: [
              Text(
                sprintf(S.current.showTotalCV, [
                  (start + 1).toString(),
                  end.toString(),
                  widget.contestants.length.toString(),
                ]),
                style: theme.textTheme.bodyMedium,
              ),
              24.wSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(
                    toPage - fromPage + 1,
                    (value) {
                      final index = value + fromPage;
                      final isSelected = index == currentPage;
                      return InkWell(
                        onTap: () {
                          if (!isSelected) {
                            setState(() {
                              currentPage = index;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: !isSelected
                                ? Border.all(
                                    color: theme.dividerColor,
                                  )
                                : null,
                            color: isSelected ? theme.colorScheme.primary : null,
                          ),
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? theme.colorScheme.onPrimary : null,
                              fontWeight: isSelected ? FontWeight.bold : null,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TableRowWidget extends StatefulWidget {
  final ContestantModel contestant;
  final List<ColumnTitle> titles;
  final int index;
  const TableRowWidget({
    super.key,
    required this.contestant,
    required this.titles,
    required this.index,
  });

  @override
  State<TableRowWidget> createState() => _TableRowWidgetState();
}

class _TableRowWidgetState extends State<TableRowWidget> {
  bool isHover = false;
  String cellValue(ColumnTitle title) {
    final contestant = widget.contestant;
    final achivements = contestant.exhibition.achivements;
    final achivementPoints = contestant.exhibition.achivementPoints;
    final skills = contestant.exhibition.skills;
    final skillPoints = contestant.exhibition.skillPoints;
    final experiences = contestant.exhibition.experiences;
    final experiencesPoints = contestant.exhibition.experiencePoints;
    final role = contestant.careerInfo.desiredPathway.role;
    switch (title) {
      case ColumnTitle.name:
        return contestant.personalInfo.fullName;
      case ColumnTitle.yearOfBirth:
        return contestant.personalInfo.yearOfBirth.toString();
      case ColumnTitle.email:
        return contestant.personalInfo.email;
      case ColumnTitle.phoneNumber:
        return contestant.personalInfo.phoneNo;
      case ColumnTitle.hometown:
        return contestant.personalInfo.hometown;
      case ColumnTitle.currentLocation:
        return contestant.personalInfo.currentLocation;
      case ColumnTitle.educationLevel:
        return contestant.educationInfo.education.toString();
      case ColumnTitle.university:
        return contestant.educationInfo.university;
      case ColumnTitle.major:
        return contestant.educationInfo.major;
      case ColumnTitle.gpa:
        return contestant.educationInfo.gpa.toString();
      case ColumnTitle.graduationYear:
        return contestant.educationInfo.graduationYear.toString();
      case ColumnTitle.english:
        return contestant.exhibition.english?.certification.toString() ?? '';
      case ColumnTitle.resume:
        return contestant.attachment.resumeCV;
      case ColumnTitle.totalPoint:
        return contestant.totalPoint.toString();
      case ColumnTitle.preferName:
        return contestant.personalInfo.preferName;
      case ColumnTitle.internRole:
        return contestant.careerInfo.desiredPathway.role.toString();
      case ColumnTitle.workingLocationPriority1:
        return contestant.careerInfo.desiredPathway.location.first;
      case ColumnTitle.workingLocationPriority2:
        return contestant.careerInfo.desiredPathway.location.second ?? '';
      case ColumnTitle.willingToChange:
        return contestant.careerInfo.desiredPathway.location.willingToChange?.toString() ?? '';
      case ColumnTitle.availabilityType:
        return contestant.careerInfo.availability.type.toString();
      case ColumnTitle.availabilityNote:
        return contestant.careerInfo.availability.note?.toString() ?? '';
      case ColumnTitle.achivement1:
        if (achivements.isNotEmpty) {
          return achivements[0].name;
        }
      case ColumnTitle.accomplishment1:
        if (achivements.isNotEmpty) {
          return achivements[0].accomplishment;
        }
      case ColumnTitle.achivement2:
        if (achivements.length > 1) {
          return achivements[1].name;
        }
      case ColumnTitle.accomplishment2:
        if (achivements.length > 1) {
          return achivements[1].accomplishment;
        }
      case ColumnTitle.skill1:
        if (skills.isNotEmpty) {
          return skills[0].skill;
        }
      case ColumnTitle.skill1Desc:
        if (skills.isNotEmpty) {
          return skills[0].description;
        }
      case ColumnTitle.skill2:
        if (skills.length > 1) {
          return skills[1].skill;
        }
      case ColumnTitle.skill2Desc:
        if (skills.length > 1) {
          return skills[1].description;
        }
      case ColumnTitle.skill3:
        if (skills.length > 2) {
          return skills[2].skill;
        }
      case ColumnTitle.skill3Desc:
        if (skills.length > 2) {
          return skills[2].description;
        }
      case ColumnTitle.skill4:
        if (skills.length > 3) {
          return skills[3].skill;
        }
      case ColumnTitle.skill4Desc:
        if (skills.length > 3) {
          return skills[3].description;
        }
      case ColumnTitle.skill5:
        if (skills.length > 4) {
          return skills[4].skill;
        }
      case ColumnTitle.skill5Desc:
        if (skills.length > 4) {
          return skills[4].description;
        }
      case ColumnTitle.experience1Type:
        if (experiences.isNotEmpty) {
          return experiences[0].type.toString();
        }
      case ColumnTitle.experience1Company:
        if (experiences.isNotEmpty) {
          return experiences[0].companyName.toString();
        }
      case ColumnTitle.experience1JobTitle:
        if (experiences.isNotEmpty) {
          return experiences[0].jobTitle.toString();
        }
      case ColumnTitle.experience1StartDate:
        if (experiences.isNotEmpty) {
          return experiences[0].startDate.toUIDateString;
        }
      case ColumnTitle.experience1EndDate:
        if (experiences.isNotEmpty) {
          return experiences[0].endDate.toUIDateString;
        }
      case ColumnTitle.experience2Type:
        if (experiences.length > 1) {
          return experiences[1].type.toString();
        }
      case ColumnTitle.experience2Company:
        if (experiences.length > 1) {
          return experiences[1].companyName;
        }
      case ColumnTitle.experience2JobTitle:
        if (experiences.length > 1) {
          return experiences[1].jobTitle;
        }
      case ColumnTitle.experience2StartDate:
        if (experiences.length > 1) {
          return experiences[1].startDate.toUIDateString;
        }
      case ColumnTitle.experience2EndDate:
        if (experiences.length > 1) {
          return experiences[1].endDate.toUIDateString;
        }
      case ColumnTitle.experience3Type:
        if (experiences.length > 2) {
          return experiences[2].type.toString();
        }
      case ColumnTitle.experience3Company:
        if (experiences.length > 2) {
          return experiences[2].companyName;
        }
      case ColumnTitle.experience3JobTitle:
        if (experiences.length > 2) {
          return experiences[2].jobTitle;
        }
      case ColumnTitle.experience3StartDate:
        if (experiences.length > 2) {
          return experiences[2].startDate.toUIDateString;
        }
      case ColumnTitle.experience3EndDate:
        if (experiences.length > 2) {
          return experiences[2].endDate.toUIDateString;
        }
      case ColumnTitle.submitTime:
        return DateFormat('hh:mm:ss, dd/MM/yyyy').format(contestant.submitTime);
      case ColumnTitle.englishDetail:
        return contestant.exhibition.english?.detail.toString() ?? '';
      case ColumnTitle.attachments:
        return contestant.attachment.accomplishment?.toString() ?? '';
      case ColumnTitle.personalPoint:
        return contestant.personalPoint.toString();
      case ColumnTitle.educationLevelPoint:
        return contestant.educationInfo.educationPoint(role).toString();
      case ColumnTitle.majorPoint:
        return contestant.educationInfo.calculateMajorPoint(role).toString();
      case ColumnTitle.gpaPoint:
        return contestant.educationInfo.gpaPoint(role).toString();
      case ColumnTitle.graduationYearPoint:
        return contestant.educationInfo.graduationYearPoint(role).toString();
      case ColumnTitle.desiredPathwayPoint:
        return contestant.careerInfo.desiredPathwayPoint.toString();
      case ColumnTitle.availabilityPoint:
        return contestant.careerInfo.availabilityPoint.toString();
      case ColumnTitle.achivementPoint1:
        if (achivementPoints.isNotEmpty) {
          return achivementPoints[0].toString();
        }
      case ColumnTitle.achivementPoint2:
        if (achivementPoints.length > 1) {
          return achivementPoints[1].toString();
        }
      case ColumnTitle.skillPoint1:
        if (skillPoints.isNotEmpty) {
          return skillPoints[0].toString();
        }
      case ColumnTitle.skillPoint2:
        if (skillPoints.length > 1) {
          return skillPoints[1].toString();
        }
      case ColumnTitle.skillPoint3:
        if (skillPoints.length > 2) {
          return skillPoints[2].toString();
        }
      case ColumnTitle.skillPoint4:
        if (skillPoints.length > 3) {
          return skillPoints[3].toString();
        }
      case ColumnTitle.skillPoint5:
        if (skillPoints.length > 4) {
          return skillPoints[4].toString();
        }
      case ColumnTitle.experiencePoint1:
        if (experiencesPoints.isNotEmpty) {
          return experiencesPoints[0].toString();
        }
      case ColumnTitle.experiencePoint2:
        if (experiencesPoints.length > 1) {
          return experiencesPoints[1].toString();
        }
      case ColumnTitle.experiencePoint3:
        if (experiencesPoints.length > 2) {
          return experiencesPoints[2].toString();
        }
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => PreviewContestantDialog(
            contestant: widget.contestant,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isHover
              ? theme.primaryColor.withOpacity(0.3)
              : widget.index % 2 == 0
                  ? const Color(0xFFf7f7f7)
                  : Colors.white,
        ),
        child: Row(
          children: List.generate(widget.titles.length, (index) {
            final value = cellValue(widget.titles[index]);
            final width = widget.titles[index].width;
            return TableCellWidget(
              value: value,
              isTitle: false,
              width: width,
            );
          }),
        ),
      ),
    );
  }
}

class TableCellWidget extends StatelessWidget {
  final String value;
  final bool isTitle;
  final double width;
  const TableCellWidget({
    super.key,
    required this.value,
    required this.isTitle,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
      ),
      padding: EdgeInsets.symmetric(vertical: 6.hMax, horizontal: 12.wMax),
      child: Text(
        value,
        style: textTheme.bodyMedium?.copyWith(
          fontWeight: isTitle ? FontWeight.bold : null,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
