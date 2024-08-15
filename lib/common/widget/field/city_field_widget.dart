import 'dart:convert';

import 'package:coke_platform/common/widget/field/custom_dropdown.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/model/local/city/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CityFieldWidget extends StatefulWidget {
  final String label;
  final bool required;
  final Function(CityModel city) onChange;
  final FormFieldValidator<String>? validator;
  final String? hintText;

  const CityFieldWidget({
    super.key,
    required this.label,
    this.required = false,
    required this.onChange,
    this.validator,
    this.hintText,
  });

  @override
  State<CityFieldWidget> createState() => _CityFieldWidgetState();
}

class _CityFieldWidgetState extends State<CityFieldWidget> {
  List<CityModel> cities = [];

  @override
  void initState() {
    getCities();
    super.initState();
  }

  Future<void> getCities() async {
    final data = await rootBundle.loadString(Assets.resources.cities);
    final json = jsonDecode(data);
    cities = (json as List<dynamic>).map<CityModel>((e) => CityModel.fromJson(e)).toList();
    cities.sort((a, b) => a.enName.compareTo(b.enName));
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      items: cities,
      onSelect: (value) {
        if (value != null) {
          widget.onChange.call(value);
        }
      },
      required: widget.required,
      validator: widget.validator,
      label: widget.label,
      hintText: widget.hintText,
      maxHeight: 200,
    );
  }
}
