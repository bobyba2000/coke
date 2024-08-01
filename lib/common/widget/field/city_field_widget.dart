import 'dart:convert';

import 'package:coke_platform/common/widget/field/auto_complete_widget.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/local/city/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CityFieldWidget extends StatefulWidget {
  final String label;
  final bool required;
  final Function(String city) onChange;
  final FormFieldValidator<String>? validator;

  const CityFieldWidget({
    super.key,
    required this.label,
    this.required = false,
    required this.onChange,
    this.validator,
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
    cities.sort((a, b) => a.toString().compareTo(b.toString()));
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AutoCompleteWidget<String>(
      required: widget.required,
      validator: widget.validator,
      label: widget.label,
      getSuggestData: (value) async {
        return cities
            .where(
              (element) => element.toString().toLowerCase().contains(value.toLowerCase()),
            )
            .map(
              (e) => e.toString(),
            )
            .toList();
      },
      hintText: S.current.addressHint,
      onTapItem: (value) {
        widget.onChange.call(value);
      },
      onChanged: widget.onChange,
    );
  }
}
