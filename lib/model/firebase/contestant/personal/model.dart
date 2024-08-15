import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:coke_platform/model/local/city/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class PersonalInfoModel {
  final String fullName;
  final num yearOfBirth;
  final String email;
  final String phoneNo;
  final CityModel hometown;
  final CityModel currentLocation;
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

  num calculatePoint(InternshipRole role) {
    num point = 0;

    if (yearOfBirth == 2002 || yearOfBirth == 2003) {
      point += 5;
    } else if (yearOfBirth == 2001) {
      if (role == InternshipRole.sales) {
        point += 2;
      } else {
        point += 5;
      }
    }

    return point;
  }

  factory PersonalInfoModel.fromJson(Map<String, dynamic> json) => _$PersonalInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalInfoModelToJson(this);
}
