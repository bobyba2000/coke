import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

enum InternshipRole {
  procurement,
  tradeMarketing,
  rgm,
  keyAccountOnPremise,
  keyAccountOffPremise,
  it,
  sales;
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

  factory WorkingLocationModel.fromJson(Map<String, dynamic> json) =>
      _$WorkingLocationModelFromJson(json);

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

  factory DesiredPathwayModel.fromJson(Map<String, dynamic> json) =>
      _$DesiredPathwayModelFromJson(json);

  Map<String, dynamic> toJson() => _$DesiredPathwayModelToJson(this);
}

enum AvailabilityType {
  fulltime6Months,
  shiftOff1To2PerWeek,
  shiftOff3PerWeek,
  shiftOffMoreThan3;
}

@JsonSerializable()
class AvailabilityModel {
  final AvailabilityType type;
  final String? note;

  AvailabilityModel({
    required this.type,
    required this.note,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityModelFromJson(json);

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

  factory CareerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CareerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CareerInfoModelToJson(this);
}
