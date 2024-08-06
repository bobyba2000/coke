import 'package:coke_platform/core/model/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class PointModel {
  final num totalPoint;

  PointModel({required this.totalPoint});
  factory PointModel.fromJson(Map<String, dynamic> json) {
    return _$PointModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PointModelToJson(this);
  }
}

@JsonSerializable()
class PointResponseModel extends BaseResponseModel {
  List<PointModel> data = [];

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
