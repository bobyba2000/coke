import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/datepicker_widget.dart';
import 'package:coke_platform/common/widget/field/dropdown_widget.dart';
import 'package:coke_platform/common/widget/field/major_field.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/common/widget/field/university_field.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/education/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EducationInfoWidget extends StatefulWidget {
  final Function(EducationInfoModel education) onFinish;
  final VoidCallback onBack;
  const EducationInfoWidget({super.key, required this.onFinish, required this.onBack});

  @override
  State<EducationInfoWidget> createState() => _EducationInfoWidgetState();
}

class _EducationInfoWidgetState extends State<EducationInfoWidget> with Validator {
  EducationLevel? level;
  String university = '';
  String major = '';
  double? gpa;
  DateTime? year;
  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Form(
      key: form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.current.educationBackground,
            style: textTheme.displayLarge?.copyWith(
              color: colorScheme.onBackground,
            ),
          ),
          64.h.hSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppDropDownWidget<EducationLevel>(
                  label: S.current.educationLevel,
                  required: true,
                  validator: (value) {
                    if (value == null) {
                      return S.current.inputRequired;
                    }
                    return null;
                  },
                  inputBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  items: EducationLevel.values
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.toString(),
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    level = value;
                  },
                ),
              ),
              16.wSpace,
              Expanded(
                child: UniversityFieldWidget(
                  label: S.current.university,
                  required: true,
                  validator: checkRequired,
                  onChange: (String university) {
                    this.university = university;
                  },
                ),
              ),
            ],
          ),
          16.hSpace,
          MajorFieldWidget(
            label: S.current.major,
            required: true,
            validator: checkRequired,
            onChange: (value) {
              major = value;
            },
          ),
          16.hSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: S.current.gpa,
                  validator: (value) {
                    if (value == null || value == '') {
                      return S.current.inputRequired;
                    }
                    final gpa = double.tryParse(value);
                    if (gpa != null) {
                      if (gpa >= 0 && gpa <= 10) {
                        return null;
                      }
                    }
                    return S.current.gpaValid;
                  },
                  // aboveHelperText: S.current.aboveHelperGpaText,
                  hintText: S.current.gpaHintText,
                  required: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
                  ],
                  onChanged: (value) {
                    gpa = double.tryParse(value);
                  },
                  helperText: S.current.gpaText,
                ),
              ),
              16.wSpace,
              Expanded(
                child: DatePickerWidget(
                  label: S.current.graduationYear,
                  required: true,
                  validator: checkRequired,
                  hintText: 'mm-yyyy',
                  isMonthOnly: true,
                  helperText: 'e.g. 07-2024',
                  dateFormat: 'MM-yyyy',
                  onChanged: (value) {
                    year = value;
                  },
                ),
              ),
            ],
          ),
          64.h.hSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOutlinedButton(
                title: S.current.back,
                color: Colors.black,
                onTap: () {
                  widget.onBack.call();
                },
              ),
              16.wSpace,
              CustomOutlinedButton(
                title: S.current.continueWord,
                onTap: () {
                  if (form.currentState!.validate()) {
                    widget.onFinish.call(
                      EducationInfoModel(
                        education: level!,
                        university: university,
                        major: major,
                        gpa: gpa!,
                        graduationYear: year!,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
