import 'package:coke_platform/core/model/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class PointResponseModel extends BaseResponseModel {
   num? totalPoint;

  PointResponseModel();
  @override
  PointResponseModel fromJson(Map<String, dynamic> json) {
    return _$PointResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PointResponseModelToJson(this);
  }
}
