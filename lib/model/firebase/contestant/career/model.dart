import 'package:coke_platform/generated/l10n.dart';
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

  List<String> get suggestionSkills {
    switch (this) {
      case procurement:
        return [
          'Critical thinking',
          'Data analysis',
          'Financial acumen',
          'Problem-solving',
          'Digital Literacy',
          'Business process improvement',
          'Attention to details',
          'Communication',
          'Inventory Management',
          'Data Management'
        ];
      case tradeMarketing:
        return [
          'Communication',
          'Presentation',
          'Problem-solving',
          'Stakeholder Management',
          'Numerical skill',
        ];
      case keyAccountOnPremise:
        return [
          'Communication',
          'Presentation',
          'Problem-solving',
          'Stakeholder Management',
          'Numerical skill',
        ];
      case keyAccountOffPremise:
        return [
          'Event planning and execution',
          'Numerical skill',
          'Creative thinking',
          'Presentation',
          'Stakeholder management',
          'Problem-solving',
          'Communications'
        ];
      case InternshipRole.itDataAnalyst:
      case InternshipRole.itPrivacy:
        return ['Python', 'Machine Learning', 'SQL', 'Cloud based tools', 'Business acumen', 'Communication', 'Data Analysis'];
      case sales:
        return [
          'Selling',
          'Critical Thinking',
          'Problem-solving',
          'Stakeholder Management',
          'Negotiation',
          'Influencing',
          'Numerical Skill',
        ];
      case rtm:
        return [
          'Data analysis',
          'Data Visualization',
          'Project management',
          'Communication',
          'Presentation',
          'Stakeholder management',
          'System design',
          'Data Modelling',
          'Business process improvement',
          'Agility'
        ];
    }
  }
}

enum LocationModel {
  northEast,
  northWest,
  hanoi,
  centralProvinces,
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
    } else {
      point += 5;
    }
    return point;
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

  num get calculatePoint {
    num point = 0;
    point += desiredPathwayPoint;
    point += availabilityPoint;
    return point;
  }

  CareerInfoModel({
    required this.desiredPathway,
    required this.availability,
  });

  factory CareerInfoModel.fromJson(Map<String, dynamic> json) => _$CareerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CareerInfoModelToJson(this);
}
