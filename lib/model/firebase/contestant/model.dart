import 'package:coke_platform/model/firebase/contestant/attachment/model.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'career/model.dart';
import 'education/model.dart';
import 'personal/model.dart';

part 'model.g.dart';

@JsonSerializable()
class ContestantModel {
  final String? key;
  final PersonalInfoModel personalInfo;
  final EducationInfoModel educationInfo;
  final CareerInfoModel careerInfo;
  final ExhibitionInfoModel exhibition;
  final AttachmentModel attachment;
  final DateTime submitTime;

  ContestantModel({
    required this.key,
    required this.personalInfo,
    required this.educationInfo,
    required this.careerInfo,
    required this.exhibition,
    required this.attachment,
    required this.submitTime,
  });

  factory ContestantModel.fromJson(Map<String, dynamic> json) =>
      _$ContestantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestantModelToJson(this);
}
