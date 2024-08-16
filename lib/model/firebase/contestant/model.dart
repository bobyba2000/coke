import 'package:coke_platform/model/firebase/contestant/attachment/model.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:coke_platform/model/firebase/contestant/other/model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'career/model.dart';
import 'education/model.dart';
import 'personal/model.dart';

part 'model.g.dart';

enum ContestantStatus {
  rejected,
  screened;

  @override
  String toString() {
    switch (this) {
      case ContestantStatus.rejected:
        return 'Auto-Rejected';
      case ContestantStatus.screened:
        return 'Screened';
    }
  }
}

extension NumExtension on num? {
  String toUIString() {
    if (this == null) {
      return 'N/A';
    }
    return toString();
  }
}

@JsonSerializable()
class ContestantModel {
  final String? key;
  final PersonalInfoModel personalInfo;
  final EducationInfoModel educationInfo;
  final CareerInfoModel careerInfo;
  final ExhibitionInfoModel exhibition;
  final AttachmentModel attachment;
  final ContestantOtherModel? others;
  final DateTime submitTime;
  ContestantStatus? status;

  ContestantModel({
    required this.key,
    required this.personalInfo,
    required this.educationInfo,
    required this.careerInfo,
    required this.exhibition,
    required this.attachment,
    required this.submitTime,
    this.others,
  });

  num? get personalPoint {
    return personalInfo.calculatePoint(careerInfo.desiredPathway.role);
  }

  num? get educationPoint {
    return educationInfo.calculatePoint(careerInfo.desiredPathway.role);
  }

  num? get careerPoint {
    return careerInfo.calculatePoint(
      personalInfo.hometown.toString(),
      personalInfo.currentLocation.toString(),
    );
  }

  num? get exhibitionPoint {
    if (exhibition.experiencesPoint == null) {
      return null;
    }
    return exhibition.achivementsPoint + exhibition.englishPoint + exhibition.experiencesPoint! + exhibition.skillPoint;
  }

  num get attachmentPoint {
    return attachment.point;
  }

  num? get totalPoint {
    if (exhibitionPoint == null || personalPoint == null || educationPoint == null || careerPoint == null) {
      return null;
    }
    return personalPoint! + educationPoint! + careerPoint! + exhibitionPoint! + attachmentPoint;
  }

  factory ContestantModel.fromJson(Map<String, dynamic> json) => _$ContestantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestantModelToJson(this);
}
