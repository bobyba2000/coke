import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/city_field_widget.dart';
import 'package:coke_platform/common/widget/field/dropdown_widget.dart';
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
                child: AppDropDownWidget<int>(
                  label: S.current.yearOfBirth,
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
                  items: [1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006]
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
                    birth = value;
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
