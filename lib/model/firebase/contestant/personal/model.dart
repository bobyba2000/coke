import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class PersonalInfoModel {
  final String fullName;
  final num yearOfBirth;
  final String email;
  final String phoneNo;
  final String hometown;
  final String currentLocation;

  PersonalInfoModel({
    required this.fullName,
    required this.yearOfBirth,
    required this.email,
    required this.phoneNo,
    required this.hometown,
    required this.currentLocation,
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}
