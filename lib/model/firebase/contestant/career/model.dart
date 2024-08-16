import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

enum InternshipRole {
  procurement,
  tradeMarketing,
  rtm,
  keyAccountOnPremise,
  keyAccountOffPremise,
  itDataAnalyst,
  itPrivacy,
  sales;

  String get title {
    switch (this) {
      case InternshipRole.procurement:
        return S.current.procurementTitle;
      case InternshipRole.tradeMarketing:
      case InternshipRole.rtm:
      case InternshipRole.keyAccountOnPremise:
      case InternshipRole.keyAccountOffPremise:
        return S.current.commercial;
      case InternshipRole.itDataAnalyst:
      case InternshipRole.itPrivacy:
        return S.current.it;
      case InternshipRole.sales:
        return S.current.salesTitle;
    }
  }

  Widget get background {
    final width = 1200.w;
    final height = 675.w;
    switch (this) {
      case InternshipRole.procurement:
        return Assets.images.career.procurement.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
      case InternshipRole.tradeMarketing:
        return Assets.images.career.tradeMkt.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
      case InternshipRole.rtm:
        return Assets.images.career.rtm.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
      case InternshipRole.keyAccountOnPremise:
        return Assets.images.career.onPremise.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
      case InternshipRole.keyAccountOffPremise:
        return Assets.images.career.offPremise.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
      case InternshipRole.itDataAnalyst:
        return Assets.images.career.itData.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
      case InternshipRole.itPrivacy:
        return Assets.images.career.itPrivacy.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
      case InternshipRole.sales:
        return Assets.images.career.sales.image(
          height: height,
          width: width,
          fit: BoxFit.fitWidth,
        );
    }
  }

  Future<void> showDialog() async {
    SmartDialog.show(
      builder: (context) {
        Widget left = const Expanded(
          child: SizedBox.shrink(),
        );
        Widget right = const Expanded(
          child: SizedBox.shrink(),
        );
        if (this == sales) {
          left = Column();
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: 1200.w,
          height: 675.w,
          child: Stack(
            fit: StackFit.expand,
            children: [
              background,
              Row(
                children: [
                  left,
                  right,
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String get subtitle {
    switch (this) {
      case InternshipRole.procurement:
        return S.current.directIndirect;
      case InternshipRole.tradeMarketing:
        return S.current.tradeMarketingSubtitle;
      case InternshipRole.rtm:
        return S.current.routeToMarketSubtitle;
      case InternshipRole.keyAccountOnPremise:
      case InternshipRole.keyAccountOffPremise:
        return S.current.keyAccount;
      case InternshipRole.itDataAnalyst:
        return S.current.dataAnalyst;
      case InternshipRole.itPrivacy:
        return S.current.privacyCompliance;
      case InternshipRole.sales:
        return S.current.salesSubtitle;
    }
  }

  String? get content {
    switch (this) {
      case InternshipRole.tradeMarketing:
        return S.current.tradeMarketingContent;
      case InternshipRole.keyAccountOffPremise:
        return S.current.offPremise;
      case InternshipRole.keyAccountOnPremise:
        return S.current.onPremise;
      default:
        return null;
    }
  }

  Color get color {
    switch (this) {
      case InternshipRole.procurement:
        return const Color(0xFFfe6a00);
      case InternshipRole.tradeMarketing:
        return const Color(0xFFfed700);
      case InternshipRole.rtm:
        return const Color(0xFF9933ff);
      case InternshipRole.keyAccountOnPremise:
        return const Color(0xFF3f6db8);
      case InternshipRole.keyAccountOffPremise:
        return const Color(0xFF3f6db8);
      case InternshipRole.itDataAnalyst:
        return const Color(0xFF28a549);
      case InternshipRole.itPrivacy:
        return const Color(0xFF28a549);
      case InternshipRole.sales:
        return const Color(0xFFfe0036);
    }
  }

  @override
  String toString() {
    switch (this) {
      case procurement:
        return S.current.procurement;
      case tradeMarketing:
        return S.current.tradeMarketing;
      case keyAccountOnPremise:
        return S.current.keyAccountOnPremise;
      case keyAccountOffPremise:
        return S.current.keyAccountOffPremise;
      case InternshipRole.itDataAnalyst:
        return S.current.itDataAnalyst;
      case InternshipRole.itPrivacy:
        return S.current.itPrivacy;
      case sales:
        return S.current.sales;
      case rtm:
        return S.current.routeToMarket;
    }
  }

  List<Skill> get desiredSkills {
    switch (this) {
      case InternshipRole.sales:
        return [
          Skill.influencing,
          Skill.numericalSkill,
        ];
      case InternshipRole.itDataAnalyst:
        return [
          Skill.businessAcumen,
          Skill.attentionToDetails,
        ];
      case InternshipRole.itPrivacy:
        return [
          Skill.businessAcumen,
          Skill.stakeholderManagement,
        ];
      case InternshipRole.procurement:
        return [
          Skill.businessProcessImprovement,
          Skill.attentionToDetails,
          Skill.communication,
          Skill.inventoryManagement,
          Skill.dataManagement,
        ];
      case InternshipRole.tradeMarketing:
        return [
          Skill.projectManagement,
          Skill.creativeThinking,
        ];
      case InternshipRole.rtm:
        return [
          Skill.agility,
          Skill.businessProcessImprovement,
          Skill.dataAnalysis,
          Skill.dataVisualization,
        ];
      case InternshipRole.keyAccountOnPremise:
        return []; // No skills listed for this role
      case InternshipRole.keyAccountOffPremise:
        return [
          Skill.stakeholderManagement,
          Skill.problemSolving,
          Skill.communication,
        ];
      default:
        return [];
    }
  }

  List<Skill> get essentialSkills {
    switch (this) {
      case InternshipRole.sales:
        return [
          Skill.selling,
          Skill.criticalThinking,
          Skill.problemSolving,
          Skill.stakeholderManagement,
          Skill.negotiation,
        ];
      case InternshipRole.itDataAnalyst:
        return [
          Skill.dataAnalysis,
          Skill.dataModeling,
          Skill.powerBI,
          Skill.python,
          Skill.communication,
        ];
      case InternshipRole.itPrivacy:
        return [
          Skill.dataManagement,
          Skill.forecasting, // Using Risk Analysis as Forecasting, replace with the right skill if needed
          Skill.criticalThinking,
          Skill.problemSolving,
          Skill.communication,
        ];
      case InternshipRole.procurement:
        return [
          Skill.criticalThinking,
          Skill.dataAnalysis,
          Skill.financialAcumen,
          Skill.problemSolving,
          Skill.digitalLiteracy,
        ];
      case InternshipRole.tradeMarketing:
        return [
          Skill.numericalSkill,
          Skill.communication,
          Skill.presentation,
          Skill.problemSolving,
          Skill.stakeholderManagement,
        ];
      case InternshipRole.rtm:
        return [
          Skill.projectManagement,
          Skill.stakeholderManagement,
          Skill.criticalThinking,
          Skill.communication,
          Skill.presentation,
        ];
      case InternshipRole.keyAccountOnPremise:
        return [
          Skill.communication,
          Skill.presentation,
          Skill.problemSolving,
          Skill.stakeholderManagement,
          Skill.numericalSkill,
        ];
      case InternshipRole.keyAccountOffPremise:
        return [
          Skill.eventPlanningExecution,
          Skill.numericalSkill,
          Skill.creativeThinking,
          Skill.presentation,
        ];
      default:
        return [];
    }
  }

  List<CompanyIndustry> get industries {
    switch (this) {
      case InternshipRole.itDataAnalyst:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.engineering,
          CompanyIndustry.hardwareTechnology,
          CompanyIndustry.itSoftware,
        ];
      case InternshipRole.itPrivacy:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.engineering,
          CompanyIndustry.hardwareTechnology,
          CompanyIndustry.itSoftware,
        ];
      case InternshipRole.procurement:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.engineering,
          CompanyIndustry.construction,
        ];
      case InternshipRole.tradeMarketing:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.prCommunications,
        ];
      case InternshipRole.rtm:
        return [
          CompanyIndustry.fmcg,
        ];
      case InternshipRole.keyAccountOnPremise:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.retail,
        ];
      case InternshipRole.keyAccountOffPremise:
        return [
          CompanyIndustry.fmcg,
          CompanyIndustry.retail,
        ];
      default:
        return [];
    }
  }
}

enum LocationModel {
  northEast,
  northWest,
  hanoi,
  centralProvinces,
  southProvinces,
  hochiminh,
  mekongDelta;

  @override
  String toString() {
    switch (this) {
      case LocationModel.northEast:
        return S.current.northEast;
      case LocationModel.northWest:
        return S.current.northWest;
      case LocationModel.hanoi:
        return S.current.hanoi;
      case LocationModel.centralProvinces:
        return S.current.centralProvinces;
      case LocationModel.hochiminh:
        return S.current.hoChiMinh;
      case LocationModel.mekongDelta:
        return S.current.mekongDelta;
      case LocationModel.southProvinces:
        return S.current.southProvinces;
    }
  }

  List<String> get priorityLocation {
    switch (this) {
      case LocationModel.northEast:
        return [
          'Nam Định',
          'Nam Dinh',
          'Thanh Hóa',
          'Thanh Hoa',
        ];
      case LocationModel.northWest:
        return [
          'Bắc Ninh',
          'Bac Ninh',
          'Bac Giang',
          'Bắc Giang',
        ];
      case LocationModel.hanoi:
        return [
          'Hà Nội',
          'Hanoi',
        ];
      case LocationModel.centralProvinces:
        return [
          'Quang Nam',
          'Quảng Nam',
          'Quang Ngai',
          'Quảng Ngãi',
          'Gia Lai',
        ];
      case LocationModel.hochiminh:
        return [
          'Hồ Chí Minh',
          'Ho Chi Minh City',
        ];
      case LocationModel.mekongDelta:
        return ['Can Tho', 'Cần Thơ', 'Tiền Giang', 'Tien Giang'];
      case LocationModel.southProvinces:
        return [
          'Bà Rịa - Vũng Tàu',
          'Ba Ria - Vung Tau',
          'Binh Thuan',
          'Bình Thuận',
        ];
    }
  }
}

@JsonSerializable()
class WorkingLocationModel {
  final LocationModel first;
  final LocationModel? second;
  final bool? willingToChange;

  WorkingLocationModel({
    required this.first,
    required this.second,
    required this.willingToChange,
  });

  factory WorkingLocationModel.fromJson(Map<String, dynamic> json) => _$WorkingLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkingLocationModelToJson(this);
}

@JsonSerializable()
class DesiredPathwayModel {
  final InternshipRole role;
  final WorkingLocationModel location;

  DesiredPathwayModel({
    required this.role,
    required this.location,
  });

  factory DesiredPathwayModel.fromJson(Map<String, dynamic> json) => _$DesiredPathwayModelFromJson(json);

  Map<String, dynamic> toJson() => _$DesiredPathwayModelToJson(this);
}

enum AvailabilityType {
  fulltime6Months,
  shiftOff1To2PerWeek,
  shiftOff3PerWeek,
  shiftOffMoreThan3;

  @override
  String toString() {
    switch (this) {
      case fulltime6Months:
        return S.current.fulltime6Months;
      case shiftOff1To2PerWeek:
        return S.current.shiftOff1To2;
      case shiftOff3PerWeek:
        return S.current.shiftOff3;
      case shiftOffMoreThan3:
        return S.current.shiftOffOver3;
    }
  }
}

@JsonSerializable()
class AvailabilityModel {
  final AvailabilityType type;
  final String? note;

  AvailabilityModel({
    required this.type,
    required this.note,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) => _$AvailabilityModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailabilityModelToJson(this);
}

@JsonSerializable()
class CareerInfoModel {
  final DesiredPathwayModel desiredPathway;
  final AvailabilityModel availability;

  num get desiredPathwayPoint {
    final role = desiredPathway.role;
    num point = 0;
    if (role == InternshipRole.sales) {
      if (desiredPathway.location.willingToChange == true) {
        point += 5;
      }
    }
    return point;
  }

  num locationPriority1Point(String hometown, String currentLiving) {
    final firstLocation = desiredPathway.location.first;
    final role = desiredPathway.role;
    if (role == InternshipRole.sales) {
      if (firstLocation.priorityLocation.contains(hometown)) {
        return 5;
      }
      if (firstLocation.priorityLocation.contains(currentLiving)) {
        return 3;
      }
    }
    return 0;
  }

  num locationPriority2Point(String hometown, String currentLiving) {
    final secondLocation = desiredPathway.location.second;
    if (secondLocation == null) {
      return 0;
    }
    final role = desiredPathway.role;
    if (role == InternshipRole.sales) {
      if (secondLocation.priorityLocation.contains(hometown)) {
        return 2;
      }
      if (secondLocation.priorityLocation.contains(currentLiving)) {
        return 1;
      }
    }
    return 0;
  }

  num get availabilityPoint {
    final role = desiredPathway.role;
    num point = 0;
    if (availability.type == AvailabilityType.fulltime6Months) {
      point += 5;
    } else if (availability.type == AvailabilityType.shiftOff1To2PerWeek) {
      if (role != InternshipRole.sales && role != InternshipRole.tradeMarketing) {
        point += 3;
      }
    }

    return point;
  }

  num calculatePoint(
    String hometown,
    String currentLiving,
  ) {
    num point = 0;
    point += desiredPathwayPoint;
    point += availabilityPoint;
    point += locationPriority1Point(hometown, currentLiving);
    point += locationPriority2Point(hometown, currentLiving);
    return point;
  }

  CareerInfoModel({
    required this.desiredPathway,
    required this.availability,
  });

  factory CareerInfoModel.fromJson(Map<String, dynamic> json) => _$CareerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CareerInfoModelToJson(this);
}
