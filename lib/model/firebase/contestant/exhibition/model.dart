import 'package:coke_platform/generated/l10n.dart';
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

@JsonSerializable(fieldRename: FieldRename.kebab)
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

  @override
  String toString() {
    switch (this) {
      case WorkingType.partTime:
        return S.current.partimeInternship;
      case WorkingType.fullTime:
        return S.current.fulltime;
    }
  }
}

enum CompanyIndustry {
  agriculture,
  financialServices,
  construction,
  fmcg,
  engineering,
  hardwareTechnology,
  insurance,
  itSoftware,
  logistics,
  manufacturing,
  pharmaceutical,
  realEstate,
  retail,
  prCommunications,
  tourism,
  garmentFashion;

  @override
  String toString() {
    switch (this) {
      case agriculture:
        return S.current.agriculture;
      case financialServices:
        return S.current.financial_services;
      case construction:
        return S.current.construction;
      case fmcg:
        return S.current.fmcg;
      case engineering:
        return S.current.engineering;
      case hardwareTechnology:
        return S.current.hardware_technology;
      case insurance:
        return S.current.insurance;
      case itSoftware:
        return S.current.it_software;
      case logistics:
        return S.current.logistics;
      case manufacturing:
        return S.current.manufacturing;
      case pharmaceutical:
        return S.current.pharmaceutical;
      case realEstate:
        return S.current.real_estate;
      case retail:
        return S.current.retail;
      case prCommunications:
        return S.current.pr_communications;
      case tourism:
        return S.current.tourism;
      case garmentFashion:
        return S.current.tourism;
      default:
        return super.toString();
    }
  }
}

@JsonSerializable()
class WorkingExperienceModel {
  final WorkingType type;
  final DateTime? startDate;
  final DateTime? endDate;
  final String industry;
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

  @override
  String toString() {
    switch (this) {
      case ielts:
        return S.current.ielts;
      case toeic:
        return S.current.toeic;
      case toefl:
        return S.current.toefl;
      case cambridge:
        return S.current.cambridge;
      case cefr:
        return S.current.cefr;
      case oversea:
        return S.current.oversea;
      case englishMajor:
        return S.current.englishMajor;
      case englishInstruction:
        return S.current.englishInstruction;
      case others:
        return S.current.others;
      default:
        return super.toString();
    }
  }
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
  @JsonKey(defaultValue: [])
  final List<AchivementModel> achivements;
  @JsonKey(defaultValue: [])
  final List<SkillModel> skills;
  @JsonKey(defaultValue: [])
  final List<WorkingExperienceModel> experiences;
  final EnglishProfiencyModel? english;

  ExhibitionInfoModel({
    required this.achivements,
    required this.skills,
    required this.experiences,
    required this.english,
  });

  factory ExhibitionInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ExhibitionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExhibitionInfoModelToJson(this);
}
