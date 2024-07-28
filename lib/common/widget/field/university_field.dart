import 'package:coke_platform/common/widget/field/auto_complete_widget.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';

enum University {
  vnuHanoi,
  vnuHCM,
  hust,
  udn,
  ctu,
  hueUni,
  tdt,
  ueh,
  hanu,
  ftu,
  hcmut,
  uel,
  usshVNUHanoi,
  usshVNUHCM,
  rmitVN,
  fptU,
  duyTan,
  hoaSen,
  hcmute,
  neu,
  husVNUHanoi,
  husVNUHCM,
  utc,
  umpHCM,
  hmu;

  @override
  String toString() {
    switch (this) {
      case University.vnuHanoi:
        return S.current.vnuHanoi;
      case University.vnuHCM:
        return S.current.vnuHCM;
      case University.hust:
        return S.current.hust;
      case University.udn:
        return S.current.udn;
      case University.ctu:
        return S.current.ctu;
      case University.hueUni:
        return S.current.hueUni;
      case University.tdt:
        return S.current.tdt;
      case University.ueh:
        return S.current.ueh;
      case University.hanu:
        return S.current.hanu;
      case University.ftu:
        return S.current.ftu;
      case University.hcmut:
        return S.current.hcmut;
      case University.uel:
        return S.current.uel;
      case University.usshVNUHanoi:
        return S.current.usshVNUHanoi;
      case University.usshVNUHCM:
        return S.current.usshVNUHCM;
      case University.rmitVN:
        return S.current.rmitVN;
      case University.fptU:
        return S.current.fptU;
      case University.duyTan:
        return S.current.duyTan;
      case University.hoaSen:
        return S.current.hoaSen;
      case University.hcmute:
        return S.current.hcmute;
      case University.neu:
        return S.current.neu;
      case University.husVNUHanoi:
        return S.current.husVNUHanoi;
      case University.husVNUHCM:
        return S.current.husVNUHCM;
      case University.utc:
        return S.current.utc;
      case University.umpHCM:
        return S.current.umpHCM;
      case University.hmu:
        return S.current.hmu;
    }
  }
}

class UniversityFieldWidget extends StatefulWidget {
  final String label;
  final bool required;
  final Function(String university) onChange;
  final FormFieldValidator<String>? validator;

  const UniversityFieldWidget({
    super.key,
    required this.label,
    this.required = false,
    required this.onChange,
    this.validator,
  });

  @override
  State<UniversityFieldWidget> createState() => _UniversityFieldWidgetState();
}

class _UniversityFieldWidgetState extends State<UniversityFieldWidget> {
  List<University> universities = University.values;

  @override
  Widget build(BuildContext context) {
    return AutoCompleteWidget<String>(
      required: widget.required,
      validator: widget.validator,
      label: widget.label,
      getSuggestData: (value) async {
        return universities
            .where(
              (element) => element.toString().toLowerCase().contains(value.toLowerCase()),
            )
            .map(
              (e) => e.toString(),
            )
            .toList();
      },
      onTapItem: (value) {
        widget.onChange.call(value);
      },
      onChanged: widget.onChange,
    );
  }
}
