import 'package:coke_platform/common/utility/string.dart';
import 'package:coke_platform/constants/others.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/data/request/point/model.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:coke_platform/service/point.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
part 'model.g.dart';

@JsonSerializable()
class AchivementModel {
  final String name;
  final String accomplishment;

  AchivementModel({
    required this.name,
    required this.accomplishment,
  });

  factory AchivementModel.fromJson(Map<String, dynamic> json) => _$AchivementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AchivementModelToJson(this);
}

enum Skill {
  agility,
  attentionToDetails,
  businessAcumen,
  businessProcessImprovement,
  cloudBasedTools,
  communication,
  creativeThinking,
  criticalThinking,
  dataAnalysis,
  dataManagement,
  dataModeling,
  dataVisualization,
  digitalLiteracy,
  digitalMarketing,
  eventPlanningExecution,
  financialAcumen,
  forecasting,
  influencing,
  inventoryManagement,
  machineLearning,
  marketResearch,
  materialDesign,
  msOffice,
  negotiation,
  nielsonReporting,
  numericalSkill,
  powerBI,
  presentation,
  problemSolving,
  projectManagement,
  python,
  selling,
  sql,
  stakeholderManagement,
  riskAnalysis,
  dataProtection;

  @override
  String toString() {
    switch (this) {
      case Skill.agility:
        return S.current.agility;
      case Skill.attentionToDetails:
        return S.current.attentionToDetails;
      case Skill.businessAcumen:
        return S.current.businessAcumen;
      case Skill.businessProcessImprovement:
        return S.current.businessProcessImprovement;
      case Skill.cloudBasedTools:
        return S.current.cloudBasedTools;
      case Skill.communication:
        return S.current.communication;
      case Skill.creativeThinking:
        return S.current.creativeThinking;
      case Skill.criticalThinking:
        return S.current.criticalThinking;
      case Skill.dataAnalysis:
        return S.current.dataAnalysis;
      case Skill.dataManagement:
        return S.current.dataManagement;
      case Skill.dataModeling:
        return S.current.dataModeling;
      case Skill.dataVisualization:
        return S.current.dataVisualization;
      case Skill.digitalLiteracy:
        return S.current.digitalLiteracy;
      case Skill.digitalMarketing:
        return S.current.digitalMarketing;
      case Skill.eventPlanningExecution:
        return S.current.eventPlanningExecution;
      case Skill.financialAcumen:
        return S.current.financialAcumen;
      case Skill.forecasting:
        return S.current.forecasting;
      case Skill.influencing:
        return S.current.influencing;
      case Skill.inventoryManagement:
        return S.current.inventoryManagement;
      case Skill.machineLearning:
        return S.current.machineLearning;
      case Skill.marketResearch:
        return S.current.marketResearch;
      case Skill.materialDesign:
        return S.current.materialDesign;
      case Skill.msOffice:
        return S.current.msOffice;
      case Skill.negotiation:
        return S.current.negotiation;
      case Skill.nielsonReporting:
        return S.current.nielsonReporting;
      case Skill.numericalSkill:
        return S.current.numericalSkill;
      case Skill.powerBI:
        return S.current.powerBI;
      case Skill.presentation:
        return S.current.presentation;
      case Skill.problemSolving:
        return S.current.problemSolving;
      case Skill.projectManagement:
        return S.current.projectManagement;
      case Skill.python:
        return S.current.python;
      case Skill.selling:
        return S.current.selling;
      case Skill.sql:
        return S.current.sql;
      case Skill.stakeholderManagement:
        return S.current.stakeholderManagement;
      case Skill.riskAnalysis:
        return S.current.riskAnalysis;
      case Skill.dataProtection:
        return S.current.dataProtection;
    }
  }
}

@JsonSerializable(fieldRename: FieldRename.kebab)
class SkillModel {
  final Skill skill;
  final String description;

  SkillModel({
    required this.skill,
    required this.description,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => _$SkillModelFromJson(json);

  Map<String, dynamic> toJson() => _$SkillModelToJson(this);
}

enum WorkingType {
  partTime,
  internship,
  fullTime;

  @override
  String toString() {
    switch (this) {
      case WorkingType.partTime:
        return S.current.partime;
      case WorkingType.fullTime:
        return S.current.fulltime;
      case WorkingType.internship:
        return S.current.internship;
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
        return S.current.garment_fashion;
    }
  }
}

@JsonSerializable()
class WorkingExperienceModel {
  final WorkingType type;
  final DateTime? startDate;
  final DateTime? endDate;
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

  factory WorkingExperienceModel.fromJson(Map<String, dynamic> json) => _$WorkingExperienceModelFromJson(json);

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

  factory EnglishProfiencyModel.fromJson(Map<String, dynamic> json) => _$EnglishProfiencyModelFromJson(json);

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
  @JsonKey(defaultValue: [])
  List<num> skillPoints = [];
  @JsonKey(defaultValue: [])
  List<num> experiencePoints = [];
  @JsonKey(defaultValue: [])
  List<num> achivementPoints = [];
  num englishPoint = 0;

  num get achivementsPoint {
    num res = 0;
    for (var point in achivementPoints) {
      res += point;
    }
    return res;
  }

  num get experiencesPoint {
    num res = 0;
    for (var point in experiencePoints) {
      res += point;
    }
    return res;
  }

  num get skillPoint {
    num res = 0;
    for (var point in skillPoints) {
      res += point;
    }
    return res;
  }

  ExhibitionInfoModel({
    required this.achivements,
    required this.skills,
    required this.experiences,
    required this.english,
  });

  Future<void> calculatePoint(InternshipRole role) async {
    skillPoints = [];
    experiencePoints = [];
    achivementPoints = [];
    englishPoint = 0;
    final service = AppDependencies.injector.get<PointService>();
    try {
      skillPoints = await Future.wait(
        skills.map(
          (e) async {
            num point = 0;
            int countWords(String text) {
              final words = text.trim().split(RegExp(r'\s+'));
              return words.length;
            }

            if (role.desiredSkills.contains(e.skill) || role.essentialSkills.contains(e.skill)) {
              if (countWords(e.description) > 80) {
                final descriptionPoint = await service.calcSkillPoint(
                  PointRequestModel(
                    skills: [e],
                  ),
                );
                point += descriptionPoint.data?.data.first.point ?? 0;
              } else {
                point = 1;
              }

              if (role.essentialSkills.contains(e.skill)) {
                point = point * 2;
              }
            }
            return point;
          },
        ),
      );
    } catch (e) {
      Logger().e(e);
    }

    final competitions = [
      'Battle of Mind (BAT)',
      'Unilever\'s Future Leaders\' League (UFLL)',
      'L\'Oreal Brandstorm',
      'HSBC Business Challenge',
      'Nielsen Case Competition',
      'P&G CEO Challenge',
      'Vietnam Young Lions',
      'Marketing On Air',
      'Doanh Nhân Tập Sự',
      'Ứng viên tài năng'
    ];

    for (var achivement in achivements) {
      final isExist = competitions.any((element) => StringUtility.compare(achivement.name, element) > 0.7);
      if (isExist) {
        if (achivement.accomplishment == 'Top 1' ||
            achivement.accomplishment == 'Top 2' ||
            achivement.accomplishment == 'Champion' ||
            achivement.accomplishment == 'Vô địch' ||
            achivement.accomplishment == 'Quán quân' ||
            achivement.accomplishment == 'Á quân' ||
            achivement.accomplishment == 'Runner-up') {
          achivementPoints.add(5);
          continue;
        } else {
          for (var i = 3; i < 11; i++) {
            if (achivement.accomplishment == 'Top $i') {
              achivementPoints.add(2);
              break;
            }
          }
          continue;
        }
      } else {
        achivementPoints.add(0);
      }
    }

    num dateDifference = 0;
    for (var experience in experiences) {
      num point = 0;
      if (experience.startDate == null || experience.endDate == null) {
        experiencePoints.add(0);
        continue;
      }
      dateDifference += experience.endDate!.difference(experience.startDate!).inDays;
      final industry = experience.industry;
      final isExist = role == InternshipRole.sales ? true : role.industries.contains(industry);
      if (isExist) {
        point += 2;
      }
      final isCompanyExist = OthersConstant.companies.any((element) => StringUtility.compare(experience.companyName, element) > 0.7);
      if (isCompanyExist) {
        point += 2;
      }

      List<String> titles = [];
      switch (role) {
        case InternshipRole.procurement:
          titles = OthersConstant.procurementTitles;
          break;
        case InternshipRole.tradeMarketing:
          titles = OthersConstant.tradeMarketingTitles;
          break;
        case InternshipRole.rtm:
          titles = OthersConstant.rtmTitles;
          break;
        case InternshipRole.itDataAnalyst:
        case InternshipRole.itPrivacy:
          titles = OthersConstant.itTitles;
          break;
        case InternshipRole.sales:
          titles = OthersConstant.saleTitles;
          break;
        default:
          titles = OthersConstant.keyAccountTitles;
          break;
      }
      final isTitleExist = titles.any((element) => StringUtility.compare(experience.jobTitle, element) > 0.6);
      if (isTitleExist) {
        point += 2;
      }
      experiencePoints.add(point);
    }
    if (dateDifference < 365) {
      experiencePoints = List.generate(experiences.length, (index) => 0);
    }

    if (english != null) {
      final cert = english!.certification;
      final detail = english!.detail;
      switch (cert) {
        case EnglistCertification.ielts:
          final point = num.tryParse(detail) ?? 0;
          if (point >= 7) {
            englishPoint = 5;
          } else if (point >= 5.5) {
            englishPoint = 3;
          }
          break;
        case EnglistCertification.toeic:
          final point = num.tryParse(detail) ?? 0;
          if (point >= 800) {
            englishPoint = 5;
          } else if (point >= 600) {
            englishPoint = 3;
          }
          break;
        case EnglistCertification.toefl:
          final point = num.tryParse(detail) ?? 0;
          if (point >= 80) {
            englishPoint = 5;
          } else if (point >= 61) {
            englishPoint = 3;
          }
          break;
        case EnglistCertification.cambridge:
          if (detail == 'CAE' || detail == 'CPE') {
            englishPoint = 5;
          } else if (detail == 'FCE') {
            englishPoint = 3;
          }
          break;
        case EnglistCertification.cefr:
          if (detail == 'C1' || detail == 'C2') {
            englishPoint = 5;
          } else if (detail == 'B2') {
            englishPoint = 3;
          }
          break;
        case EnglistCertification.oversea:
        case EnglistCertification.englishMajor:
        case EnglistCertification.englishInstruction:
          englishPoint = 5;
          break;
        case EnglistCertification.others:
          englishPoint = 0;
      }
    }
  }

  factory ExhibitionInfoModel.fromJson(Map<String, dynamic> json) => _$ExhibitionInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExhibitionInfoModelToJson(this);
}
