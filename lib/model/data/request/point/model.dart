import 'package:coke_platform/core/model/base_request_model.dart';
import 'package:coke_platform/model/firebase/contestant/exhibition/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable(createFactory: false)
class PointRequestModel extends BaseRequestModel {
  final List<SkillModel> skills;

  PointRequestModel({ required this.skills});

  @override
  Map<String, dynamic> toJson() {
    return _$PointRequestModelToJson(this);
  }
}
