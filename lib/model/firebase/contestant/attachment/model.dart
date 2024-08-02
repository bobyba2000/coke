import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class AttachmentModel {
  final String resumeCV;
  final String? accomplishment;

  num get point {
    if (accomplishment != null) {
      return 2;
    }
    return 0;
  }

  AttachmentModel({
    required this.resumeCV,
    required this.accomplishment,
  });

  factory AttachmentModel.fromJson(Map<String, dynamic> json) => _$AttachmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttachmentModelToJson(this);
}
