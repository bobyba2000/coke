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
  final String preferName;

  PersonalInfoModel({
    required this.fullName,
    required this.yearOfBirth,
    required this.email,
    required this.phoneNo,
    required this.hometown,
    required this.currentLocation,
    required this.preferName, 
  });

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) => _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}
