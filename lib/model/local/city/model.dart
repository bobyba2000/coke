import 'package:coke_platform/common/utility/locale.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CityModel {
  final String name;
  final String code;
  final String enName;
  final String nameWithType;

  CityModel({
    required this.name,
    required this.code,
    required this.nameWithType,
    required this.enName,
  });

  @override
  String toString() {
    if (LocaleUtility.locale.value.languageCode == 'en') {
      return enName;
    }
    return name;
  }

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
