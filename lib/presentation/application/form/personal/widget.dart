import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/auto_complete_widget.dart';
import 'package:coke_platform/common/widget/field/city_field_widget.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/personal/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInformationWidget extends StatefulWidget {
  final Function(PersonalInfoModel personal) onFinish;
  const PersonalInformationWidget({super.key, required this.onFinish});

  @override
  State<PersonalInformationWidget> createState() => _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> with Validator {
  String fullname = '';
  String phone = '';
  int? birth;
  String hometown = '';
  String currentLocation = '';
  String email = '';
  String preferName = '';
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
            S.current.personalInformation,
            style: textTheme.displayLarge?.copyWith(
              color: colorScheme.onBackground,
            ),
          ),
          64.h.hSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: S.current.fullName,
                  validator: checkRequired,
                  required: true,
                  onChanged: (value) {
                    fullname = value;
                  },
                ),
              ),
              16.wSpace,
              Expanded(
                child: TextFieldWidget(
                  label: S.current.preferName,
                  onChanged: (value) {
                    preferName = value;
                  },
                ),
              ),
              16.wSpace,
              Expanded(
                child: AutoCompleteWidget(
                  getSuggestData: (value) async {
                    return [1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006]
                        .where(
                          (element) => element.toString().contains(value),
                        )
                        .toList();
                  },
                  
                  label: S.current.yearOfBirth,
                  required: true,
                  validator: (value) {
                    if (value == null || value == '') {
                      return S.current.inputRequired;
                    }
                    final yearRegex = RegExp(r'^(19[0-9]{2}|20[0-1][0-9]|202[0-3])$');
                    if (!yearRegex.hasMatch(value)) {
                      return S.current.invalidYear;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          16.hSpace,
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  label: S.current.email,
                  validator: checkEmail,
                  required: true,
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              16.wSpace,
              Expanded(
                child: TextFieldWidget(
                  label: S.current.phoneNumber,
                  validator: checkPhoneNumber,
                  required: true,
                  onChanged: (value) {
                    phone = value;
                  },
                ),
              ),
            ],
          ),
          16.hSpace,
          Row(
            children: [
              Expanded(
                child: CityFieldWidget(
                  label: S.current.homeTown,
                  required: true,
                  validator: checkRequired,
                  
                  onChange: (String city) {
                    hometown = city;
                  },
                ),
              ),
              16.wSpace,
              Expanded(
                child: CityFieldWidget(
                  label: S.current.currentLivingLocation,
                  required: true,
                  validator: checkRequired,
                  onChange: (String city) {
                    currentLocation = city;
                  },
                ),
              ),
            ],
          ),
          64.h.hSpace,
          CustomOutlinedButton(
            title: S.current.continueWord,
            onTap: () {
              if (form.currentState!.validate()) {
                widget.onFinish.call(
                  PersonalInfoModel(
                    fullName: fullname,
                    yearOfBirth: birth!,
                    email: email,
                    phoneNo: phone,
                    hometown: hometown,
                    currentLocation: currentLocation,
                    preferName: preferName,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
