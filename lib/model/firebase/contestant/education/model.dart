import 'package:coke_platform/common/widget/field/major_field.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

enum EducationLevel {
  master,
  bachelor,
  college;

  @override
  String toString() {
    switch (this) {
      case master:
        return S.current.masterDegree;
      case bachelor:
        return S.current.bachelorDegree;
      case college:
        return S.current.collegeDegree;
    }
  }
}

enum GraduationYear {
  before2024,
  in2024,
  in2025,
  from2026;

  @override
  String toString() {
    switch (this) {
      case before2024:
        return S.current.before2024;
      case in2024:
        return S.current.within2024;
      case in2025:
        return S.current.within2025;
      case from2026:
        return S.current.above2026;
    }
  }
}

@JsonSerializable()
class EducationInfoModel {
  final EducationLevel education;
  final String university;
  final Major major;
  final num gpa;
  final DateTime graduationYear;

  EducationInfoModel({
    required this.education,
    required this.university,
    required this.major,
    required this.gpa,
    required this.graduationYear,
  });

  num calculateMajorPoint(InternshipRole role) {
    List<Major> fields = [];
    switch (role) {
      case InternshipRole.itDataAnalyst:
      case InternshipRole.itPrivacy:
        fields = [
          Major.computerScienceAndIT,
          Major.informationSystem,
          Major.dataScience,
        ];
        break;
      case InternshipRole.procurement:
        fields = [
          Major.engineeringRelatedMajors,
        ];
        break;
      case InternshipRole.tradeMarketing:
        fields = [
          Major.marketingAndIntegratedCommunications,
        ];
        break;
      case InternshipRole.sales:
        return 5;
      default:
        fields = [
          Major.economicsBusinessAdministration,
          Major.foreignTrade,
          Major.marketingAndIntegratedCommunications,
          Major.dataAnalysisDataIntelligence,
          Major.financeBanking,
          Major.accountingAuditing,
        ];
        break;
    }
    final isExist = fields.any((element) => element == major);

    return isExist ? 5 : 0;
  }

  num educationPoint(InternshipRole role) {
    if (role == InternshipRole.sales) {
      if (education != EducationLevel.master) {
        return 5;
      }
    } else {
      if (education != EducationLevel.college) {
        return 5;
      }
    }
    return 0;
  }

  num gpaPoint(InternshipRole role) {
    num point = 0;
    if (gpa >= 8.5) {
      point += 5;
    } else if (gpa >= 7) {
      point += 3;
    } else if (gpa >= 6) {
      if (role == InternshipRole.sales) {
        point += 3;
      }
    }
    return point;
  }

  num graduationYearPoint(InternshipRole role) {
    num point = 0;
    if (graduationYear.isBefore(DateTime(2024))) {
      point += 0;
    } else if (graduationYear.isBefore(DateTime(2025))) {
      point += 5;
    } else if (graduationYear.isBefore(DateTime(2026))) {
      if (role == InternshipRole.sales) {
        point = 2;
      } else {
        point = 5;
      }
    }
    return point;
  }

  num calculatePoint(InternshipRole role) {
    num point = 0;

    point += educationPoint(role);

    point += calculateMajorPoint(role);

    point += gpaPoint(role);

    point += graduationYearPoint(role);

    return point;
  }

  factory EducationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EducationInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationInfoModelToJson(this);
}
