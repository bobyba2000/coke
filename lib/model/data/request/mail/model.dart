import 'package:coke_platform/core/model/base_request_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable(createFactory: false)
class MailRequestModel extends BaseRequestModel {
  final String name;
  final String email;
  final String language;

  MailRequestModel({
    required this.name,
    required this.email,
    required this.language,
  });

  @override
  Map<String, dynamic> toJson() {
    return _$MailRequestModelToJson(this);
  }
}
