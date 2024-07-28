import 'package:coke_platform/generated/l10n.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

enum InternshipRole {
  procurement,
  tradeMarketing,
  rgm,
  rtm,
  keyAccountOnPremise,
  keyAccountOffPremise,
  it,
  sales;

  @override
  String toString() {
    switch (this) {
      case procurement:
        return S.current.procurement;
      case tradeMarketing:
        return S.current.tradeMarketing;
      case rgm:
        return S.current.revenueGrowthManagement;
      case keyAccountOnPremise:
        return S.current.keyAccountOnPremise;
      case keyAccountOffPremise:
        return S.current.keyAccountOffPremise;
      case it:
        return S.current.it;
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
      case rgm:
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
      case it:
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

@JsonSerializable()
class WorkingLocationModel {
  final String first;
  final String? second;
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

  CareerInfoModel({
    required this.desiredPathway,
    required this.availability,
  });

  factory CareerInfoModel.fromJson(Map<String, dynamic> json) => _$CareerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CareerInfoModelToJson(this);
}
