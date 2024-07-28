import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/dropdown_widget.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareerInfoWidget extends StatefulWidget {
  final Function(CareerInfoModel career) onFinish;
  const CareerInfoWidget({super.key, required this.onFinish});

  @override
  State<CareerInfoWidget> createState() => _CareerInfoWidgetState();
}

class _CareerInfoWidgetState extends State<CareerInfoWidget> with Validator {
  InternshipRole? role;
  String? priority1;
  String? priority2;
  bool? willingToReallocate;
  List<String> locations = [
    'North East',
    'North West',
    'Ha Noi',
    'Central Provinces',
    'South Provinces',
    'Ho Chi Minh',
    'Mekong Delta',
  ];

  List<DropdownMenuItem<String>> priority1Locations = [
    'North East',
    'North West',
    'Ha Noi',
    'Central Provinces',
    'South Provinces',
    'Ho Chi Minh',
    'Mekong Delta',
  ]
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  List<DropdownMenuItem<String>> priority2Locations = [
    'North East',
    'North West',
    'Ha Noi',
    'Central Provinces',
    'South Provinces',
    'Ho Chi Minh',
    'Mekong Delta',
  ]
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ),
      )
      .toList();

  List<DropdownMenuItem<AvailabilityType>> availabilities = AvailabilityType.values
      .map(
        (e) => DropdownMenuItem(
          value: e,
          child: Text(e.toString()),
        ),
      )
      .toList();

  AvailabilityType? availability;
  String? note;

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
            S.current.careerAspiration,
            style: textTheme.displayLarge?.copyWith(
              color: colorScheme.onBackground,
            ),
          ),
          64.h.hSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.desiredPathway,
                style: textTheme.displaySmall?.copyWith(
                  color: colorScheme.onBackground,
                ),
              ),
              8.hSpace,
              AppDropDownWidget<InternshipRole>(
                label: S.current.internshipRole,
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
                value: role,
                items: InternshipRole.values
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
                  if (role != value) {
                    role = value;

                    if (role != InternshipRole.sales) {
                      priority1 = 'HCM - Head Office';
                      priority2 = null;
                      willingToReallocate = false;
                    } else {
                      priority1 = null;
                      willingToReallocate = true;
                      priority2Locations = locations
                          .where((element) => element != priority1)
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.toString(),
                              ),
                            ),
                          )
                          .toList();
                    }
                    setState(() {});
                  }
                },
              ),
              16.hSpace,
              role == InternshipRole.sales
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: AppDropDownWidget<String>(
                                label: '${S.current.workingLocation} - ${S.current.priority1}',
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
                                items: priority1Locations,
                                onChanged: (value) {
                                  if (priority1 != value) {
                                    priority1 = value;
                                    if (priority2 == value) {
                                      priority2 = null;
                                    }
                                    priority2Locations = locations
                                        .where((element) => element != priority1)
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e.toString(),
                                            ),
                                          ),
                                        )
                                        .toList();
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                            16.wSpace,
                            Expanded(
                              child: AppDropDownWidget<String>(
                                label: '${S.current.workingLocation} - ${S.current.priority2}',
                                required: true,
                                isNeedToReset: true,
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
                                value: priority2,
                                items: priority2Locations,
                                onChanged: (value) {
                                  priority2 = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        16.hSpace,
                        Text(
                          S.current.willingToRelocate,
                          style: textTheme.bodyLarge,
                        ),
                        2.hSpace,
                        Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue: willingToReallocate,
                              onChanged: (value) {
                                willingToReallocate = true;
                                setState(() {});
                              },
                            ),
                            Text(
                              S.current.yes,
                              style: textTheme.bodyMedium,
                            ),
                            16.wSpace,
                            Radio(
                              value: false,
                              groupValue: willingToReallocate,
                              onChanged: (value) {
                                willingToReallocate = false;
                                setState(() {});
                              },
                            ),
                            Text(
                              S.current.no,
                              style: textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    )
                  : role == null
                      ? const SizedBox.shrink()
                      : Text(
                          S.current.workAtHCMHeadOffice,
                          style: textTheme.bodyLarge,
                        ),
            ],
          ),
          16.hSpace,
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppDropDownWidget<AvailabilityType>(
                label: S.current.yourAvailability,
                helperText: S.current.helperAvailabilityText,
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
                value: availability,
                items: availabilities,
                onChanged: (value) {
                  availability = value;
                  note = null;
                  setState(() {});
                },
              ),
              if (availability != null && availability != AvailabilityType.fulltime6Months)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: TextFieldWidget(
                    label: S.current.note,
                    required: true,
                    validator: checkRequired,
                    onChanged: (value) {
                      note = value;
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
                  CareerInfoModel(
                    desiredPathway: DesiredPathwayModel(
                      role: role!,
                      location: WorkingLocationModel(
                        first: priority1!,
                        second: priority2,
                        willingToChange: willingToReallocate,
                      ),
                    ),
                    availability: AvailabilityModel(
                      type: availability!,
                      note: note,
                    ),
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
