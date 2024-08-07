import 'package:coke_platform/generated/l10n.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

enum ProgramChannel {
  cocacolaMedia,
  friends,
  careerSite,
  university,
  vco,
  yBox,
  aiesec,
  others;

  @override
  String toString() {
    switch (this) {
      case ProgramChannel.cocacolaMedia:
        return S.current.cocacolaMedia;
      case ProgramChannel.friends:
        return S.current.friends;
      case ProgramChannel.careerSite:
        return S.current.careerSite;
      case ProgramChannel.university:
        return S.current.universityChannel;
      case ProgramChannel.vco:
        return S.current.vco;
      case ProgramChannel.yBox:
        return S.current.yBox;
      case ProgramChannel.aiesec:
        return S.current.aiesec;
      case ProgramChannel.others:
        return S.current.otherChannel;
    }
  }
}

@JsonSerializable()
class ContestantOtherModel {
  final bool submitRecommendation;
  final ProgramChannel hearFrom;

  ContestantOtherModel({required this.submitRecommendation, required this.hearFrom});

  factory ContestantOtherModel.fromJson(Map<String, dynamic> json) => _$ContestantOtherModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestantOtherModelToJson(this);
}
