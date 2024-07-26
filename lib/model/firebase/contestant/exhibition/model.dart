import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class AchivementModel {
  final String name;
  final String accomplishment;

  AchivementModel({
    required this.name,
    required this.accomplishment,
  });

  factory AchivementModel.fromJson(Map<String, dynamic> json) =>
      _$AchivementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AchivementModelToJson(this);
}

@JsonSerializable()
class SkillModel {
  final String skill;
  final String description;

  SkillModel({
    required this.skill,
    required this.description,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) =>
      _$SkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$SkillModelToJson(this);
}

enum WorkingType {
  partTime,
  fullTime;
}

enum CompanyIndustry {
  agriculture,
  financial,
  construction,
  fmcg,
  engineering,
  hardwareTechnology,
  insurance,
  other;
}

@JsonSerializable()
class WorkingExperienceModel {
  final WorkingType type;
  final DateTime startDate;
  final DateTime endDate;
  final CompanyIndustry industry;
  final String companyName;
  final String jobTitle;

  WorkingExperienceModel({
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.industry,
    required this.companyName,
    required this.jobTitle,
  });

  factory WorkingExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkingExperienceModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingExperienceModelToJson(this);
}

enum EnglistCertification {
  ielts,
  toeic,
  toefl,
  cambridge,
  cefr,
  oversea,
  englishMajor,
  englishInstruction,
  others;
}

@JsonSerializable()
class EnglishProfiencyModel {
  final EnglistCertification certification;
  final String detail;

  EnglishProfiencyModel({
    required this.certification,
    required this.detail,
  });

  factory EnglishProfiencyModel.fromJson(Map<String, dynamic> json) =>
      _$EnglishProfiencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$EnglishProfiencyModelToJson(this);
}

@JsonSerializable()
class ExhibitionInfoModel {
  final AchivementModel achivement;
  final List<SkillModel> skills;
  final List<WorkingExperienceModel> experiences;
  final EnglishProfiencyModel english;

  ExhibitionInfoModel({
    required this.achivement,
    required this.skills,
    required this.experiences,
    required this.english,
  });

  factory ExhibitionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ExhibitionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExhibitionInfoModelToJson(this);
}
