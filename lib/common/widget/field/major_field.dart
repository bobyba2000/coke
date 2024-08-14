import 'package:coke_platform/common/widget/field/custom_dropdown.dart';
import 'package:coke_platform/generated/l10n.dart';

import 'package:flutter/material.dart';

enum Major {
  foreignTrade,
  humanResources,
  lawAndLegalStudies,
  marketingAndIntegratedCommunications,
  logisticsAndSupplyChainManagement,
  industrialManagement,
  financeBanking,
  accountingAuditing,
  naturalScience,
  socialScienceAndHumanity,
  computerScienceAndIT,
  informationSystem,
  computerEngineering,
  cyberSecurityAndDataPrivacy,
  dataScience,
  softwareEngineering,
  medicineAndHealthcareSciences,
  architectureDesignConstruction,
  engineeringRelatedMajors,
  telecommunication,
  agricultureFeedForestry,
  economicsBusinessAdministration,
  dataAnalysisDataIntelligence,;

  @override
  String toString() {
    switch (this) {
      case Major.foreignTrade:
        return S.current.foreignTrade;
      case Major.humanResources:
        return S.current.humanResources;
      case Major.lawAndLegalStudies:
        return S.current.lawAndLegalStudies;
      case Major.marketingAndIntegratedCommunications:
        return S.current.marketingAndIntegratedCommunications;
      case Major.logisticsAndSupplyChainManagement:
        return S.current.logisticsAndSupplyChainManagement;
      case Major.industrialManagement:
        return S.current.industrialManagement;
      case Major.financeBanking:
        return S.current.financeBanking;
      case Major.accountingAuditing:
        return S.current.accountingAuditing;
      case Major.naturalScience:
        return S.current.naturalScience;
      case Major.socialScienceAndHumanity:
        return S.current.socialScienceAndHumanity;
      case Major.computerScienceAndIT:
        return S.current.computerScienceAndIT;
      case Major.informationSystem:
        return S.current.informationSystem;
      case Major.computerEngineering:
        return S.current.computerEngineering;
      case Major.cyberSecurityAndDataPrivacy:
        return S.current.cyberSecurityAndDataPrivacy;
      case Major.dataScience:
        return S.current.dataScience;
      case Major.softwareEngineering:
        return S.current.softwareEngineering;
      case Major.medicineAndHealthcareSciences:
        return S.current.medicineAndHealthcareSciences;
      case Major.architectureDesignConstruction:
        return S.current.architectureDesignConstruction;
      case Major.engineeringRelatedMajors:
        return S.current.engineeringRelatedMajors;
      case Major.telecommunication:
        return S.current.telecommunication;
      case Major.agricultureFeedForestry:
        return S.current.agricultureFeedForestry;
      case Major.economicsBusinessAdministration:
        return S.current.economicsBusinessAdministration;
      case Major.dataAnalysisDataIntelligence:
        return S.current.dataAnalysisDataIntelligence;
    }
  }
}

class MajorFieldWidget extends StatefulWidget {
  final String label;
  final bool required;
  final Function(Major major) onChange;
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
    return CustomDropdown(
      validator: widget.validator,
      label: widget.label,
      hintText: S.current.majorHintText,
      items: majors,
      onSelect: (value) {
        if (value != null) {
          widget.onChange.call(value);
        }
      },
      required: true,
    );
  }
}
