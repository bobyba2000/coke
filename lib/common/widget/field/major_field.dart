import 'package:coke_platform/common/widget/field/auto_complete_widget.dart';
import 'package:coke_platform/generated/l10n.dart';

import 'package:flutter/material.dart';

enum Major {
  economics,
  foreignTrade,
  humanResources,
  lawLegalStudies,
  marketingIntegratedCommunications,
  logisticsSupplyChainManagement,
  industrialManagement,
  dataAnalysis,
  financeBanking,
  accountingAuditing,
  naturalScience,
  socialScienceHumanity,
  computerScienceIT,
  dataEngineeringScience,
  medicineHealthcareSciences,
  architectureDesignConstruction,
  engineeringRelatedMajors,
  automation,
  telecommunication,
  agricultureFeedForestry;

  @override
  String toString() {
    switch (this) {
      case Major.economics:
        return S.current.economics;
      case Major.foreignTrade:
        return S.current.foreignTrade;
      case Major.humanResources:
        return S.current.humanResources;
      case Major.lawLegalStudies:
        return S.current.lawAndLegalStudies;
      case Major.marketingIntegratedCommunications:
        return S.current.marketing;
      case Major.logisticsSupplyChainManagement:
        return S.current.logisticsMajor;
      case Major.industrialManagement:
        return S.current.industrialManagement;
      case Major.dataAnalysis:
        return S.current.dataAnalysis;
      case Major.financeBanking:
        return S.current.financeBanking;
      case Major.accountingAuditing:
        return S.current.accountingAuditing;
      case Major.naturalScience:
        return S.current.naturalScience;
      case Major.socialScienceHumanity:
        return S.current.socialScienceAndHumanity;
      case Major.computerScienceIT:
        return S.current.computerScienceAndIT;
      case Major.dataEngineeringScience:
        return S.current.dataEngineering;
      case Major.medicineHealthcareSciences:
        return S.current.medicineAndHealthcare;
      case Major.architectureDesignConstruction:
        return S.current.architectureDesignConstruction;
      case Major.engineeringRelatedMajors:
        return S.current.engineeringRelatedMajors;
      case Major.automation:
        return S.current.automation;
      case Major.telecommunication:
        return S.current.telecommunication;
      case Major.agricultureFeedForestry:
        return S.current.agricultureFeedForestry;
    }
  }
}

class MajorFieldWidget extends StatefulWidget {
  final String label;
  final bool required;
  final Function(String major) onChange;
  final FormFieldValidator<String>? validator;

  const MajorFieldWidget({
    super.key,
    required this.label,
    this.required = false,
    required this.onChange,
    this.validator,
  });

  @override
  State<MajorFieldWidget> createState() => _MajorFieldWidgetState();
}

class _MajorFieldWidgetState extends State<MajorFieldWidget> {
  List<Major> majors = Major.values;

  @override
  Widget build(BuildContext context) {
    return AutoCompleteWidget<String>(
      required: widget.required,
      validator: widget.validator,
      label: widget.label,
      getSuggestData: (value) async {
        return majors
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
