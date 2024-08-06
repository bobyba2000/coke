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

@JsonSerializable(fieldRename: FieldRename.kebab)
class SkillModel {
  final String skill;
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
      final response = await service.calcSkillPoint(
        PointRequestModel(role: role, skills: skills),
      );
      skillPoints = response.data?.data.map((e) => e.totalPoint).toList() ?? [];
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
        if (achivement.accomplishment == 'Top 1' || achivement.accomplishment == 'Top 2') {
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

    for (var experience in experiences) {
      num point = 0;
      final industry = experience.industry;
      final isExist = CompanyIndustry.values.any((element) =>
          StringUtility.compare(
            industry,
            element.toString(),
          ) >
          0.7);
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
      final isTitleExist = titles.any((element) => StringUtility.compare(experience.jobTitle, element) > 0.7);
      if (isTitleExist) {
        point += 2;
      }
      experiencePoints.add(point);
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
