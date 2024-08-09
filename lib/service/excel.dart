import 'package:coke_platform/common/extension/datetime_extension.dart';
import 'package:coke_platform/model/firebase/contestant/model.dart';
import 'package:coke_platform/presentation/admin/page/dashboard/widget/cv_list/table.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';

class ExcelService {
  Future<void> createExcel(List<ContestantModel> contestants) async {
    final excel = Excel.createExcel();
    excel.rename(excel.getDefaultSheet() ?? '', 'Report');

    final sheet = excel['Report'];
    CellStyle cellTitleStyle = CellStyle(
      backgroundColorHex: ExcelColor.blue50,
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    dynamic cellValue(ContestantModel contestant, ColumnTitle title) {
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
          return contestant.totalPoint;
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
          return contestant.personalPoint;
        case ColumnTitle.educationLevelPoint:
          return contestant.educationInfo.educationPoint(role);
        case ColumnTitle.majorPoint:
          return contestant.educationInfo.calculateMajorPoint(role);
        case ColumnTitle.gpaPoint:
          return contestant.educationInfo.gpaPoint(role);
        case ColumnTitle.graduationYearPoint:
          return contestant.educationInfo.graduationYearPoint(role);
        case ColumnTitle.desiredPathwayPoint:
          return contestant.careerInfo.desiredPathwayPoint;
        case ColumnTitle.availabilityPoint:
          return contestant.careerInfo.availabilityPoint;
        case ColumnTitle.achivementPoint1:
          if (achivementPoints.isNotEmpty) {
            return achivementPoints[0];
          }
        case ColumnTitle.achivementPoint2:
          if (achivementPoints.length > 1) {
            return achivementPoints[1];
          }
        case ColumnTitle.skillPoint1:
          if (skillPoints.isNotEmpty) {
            return skillPoints[0];
          }
        case ColumnTitle.skillPoint2:
          if (skillPoints.length > 1) {
            return skillPoints[1];
          }
        case ColumnTitle.skillPoint3:
          if (skillPoints.length > 2) {
            return skillPoints[2];
          }
        case ColumnTitle.skillPoint4:
          if (skillPoints.length > 3) {
            return skillPoints[3];
          }
        case ColumnTitle.skillPoint5:
          if (skillPoints.length > 4) {
            return skillPoints[4];
          }
        case ColumnTitle.experiencePoint1:
          if (experiencesPoints.isNotEmpty) {
            return experiencesPoints[0];
          }
        case ColumnTitle.experiencePoint2:
          if (experiencesPoints.length > 1) {
            return experiencesPoints[1];
          }
        case ColumnTitle.experiencePoint3:
          if (experiencesPoints.length > 2) {
            return experiencesPoints[2];
          }
        case ColumnTitle.englishPoint:
          return contestant.exhibition.englishPoint;
        case ColumnTitle.attachmentPoint:
          return contestant.attachmentPoint;
      }

      return '';
    }

    for (var i = 0; i < ColumnTitle.values.length; i++) {
      final title = ColumnTitle.values[i].toString().toUpperCase();
      var cell = sheet.cell(
        CellIndex.indexByColumnRow(
          columnIndex: i,
          rowIndex: 0,
        ),
      );
      cell.value = TextCellValue(title);
      cell.cellStyle = cellTitleStyle;
    }
    for (var j = 0; j < contestants.length; j++) {
      final data = contestants[j];
      for (var i = 0; i < ColumnTitle.values.length; i++) {
        final col = ColumnTitle.values[i];
        final strValue = cellValue(data, col);
        CellStyle cellStyle = CellStyle();
        CellValue value = strValue is num ? IntCellValue(strValue.toInt()) : TextCellValue(strValue.toString());

        final cell = sheet.cell(
          CellIndex.indexByColumnRow(
            columnIndex: i,
            rowIndex: j + 1,
          ),
        );
        cell.value = value;
        cell.cellStyle = cellStyle;
      }
    }

    excel.save(fileName: 'Report-${DateFormat('yyyyMMddhhmm').format(DateTime.now())}.xlsx');
  }
}
