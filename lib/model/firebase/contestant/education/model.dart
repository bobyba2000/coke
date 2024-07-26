import 'package:coke_platform/generated/l10n.dart';
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
  final String major;
  final num gpa;
  final GraduationYear graduationYear;

  EducationInfoModel({
    required this.education,
    required this.university,
    required this.major,
    required this.gpa,
    required this.graduationYear,
  });

  factory EducationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$EducationInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationInfoModelToJson(this);
}
