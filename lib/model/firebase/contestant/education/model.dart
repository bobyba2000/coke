import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

enum EducationLevel {
  master,
  bachelor,
  college;
}

enum GraduationYear {
  before2024,
  in2024,
  in2025,
  from2026;
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
