import 'package:coke_platform/core/model/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class VoidResponseModel extends BaseResponseModel {
  VoidResponseModel();
  @override
  VoidResponseModel fromJson(Map<String, dynamic> json) {
    return _$VoidResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$VoidResponseModelToJson(this);
  }
}
