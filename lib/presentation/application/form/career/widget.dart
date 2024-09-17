import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/custom_dropdown.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CareerInfoWidget extends StatefulWidget {
  final Function(CareerInfoModel career) onFinish;
  final VoidCallback onBack;
  const CareerInfoWidget({super.key, required this.onFinish, required this.onBack});

  @override
  State<CareerInfoWidget> createState() => _CareerInfoWidgetState();
}

class _CareerInfoWidgetState extends State<CareerInfoWidget> with Validator {
  InternshipRole role = InternshipRole.sales;
  LocationModel? priority1;
  LocationModel? priority2;
  bool? willingToReallocate;

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
          DesiredPathwayWidget(
            onChangeRole: (value) => role = value!,
            onChangeLocationPriority1: (value) => priority1 = value,
            onChangeLocationPriority2: (value) => priority2 = value,
            onChangeWillingToAllocate: (value) => willingToReallocate = value,
          ),
          16.hSpace,
          AvailabilityWidget(
            onChangeType: (value) => availability = value,
            onChangeNote: (value) => note = value,
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
        ],
      ),
    );
  }
}

class AvailabilityWidget extends StatefulWidget {
  final Function(AvailabilityType? type) onChangeType;
  final Function(String? note) onChangeNote;
  const AvailabilityWidget({
    super.key,
    required this.onChangeType,
    required this.onChangeNote,
  });

  @override
  State<AvailabilityWidget> createState() => _AvailabilityWidgetState();
}

class _AvailabilityWidgetState extends State<AvailabilityWidget> {
  List<AvailabilityType> availabilities = AvailabilityType.values;

  AvailabilityType? availability;
  String? note;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.current.yourAvailability,
              style: textTheme.displaySmall?.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            Text(
              "*",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.red,
                  ),
            ),
          ],
        ),
        Text(
          S.current.yourAvailabilityHelperText,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onBackground.withOpacity(0.5),
            fontStyle: FontStyle.italic,
          ),
        ),
        8.hSpace,
        CustomDropdown(
          items: availabilities,
          onSelect: (value) {
            availability = value;
            note = null;
            widget.onChangeNote.call(note);
            widget.onChangeType.call(availability);
            setState(() {});
          },
          required: true,
          value: availability,
        ),
        if (availability != null && availability != AvailabilityType.fulltime6Months)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: TextFieldWidget(
              label: S.current.note,
              onChanged: (value) {
                note = value;
                widget.onChangeNote.call(note);
              },
            ),
          ),
      ],
    );
  }
}

class DesiredPathwayWidget extends StatefulWidget {
  final Function(InternshipRole? role) onChangeRole;
  final Function(LocationModel? location) onChangeLocationPriority1;
  final Function(LocationModel? location) onChangeLocationPriority2;
  final Function(bool? willingToAllocate) onChangeWillingToAllocate;
  const DesiredPathwayWidget({
    super.key,
    required this.onChangeRole,
    required this.onChangeLocationPriority1,
    required this.onChangeLocationPriority2,
    required this.onChangeWillingToAllocate,
  });

  @override
  State<DesiredPathwayWidget> createState() => _DesiredPathwayWidgetState();
}

class _DesiredPathwayWidgetState extends State<DesiredPathwayWidget> {
  InternshipRole role = InternshipRole.sales;
  LocationModel? priority1;
  LocationModel? priority2;
  bool? willingToReallocate;

  List<LocationModel> locations = LocationModel.values;

  List<LocationModel> priority1Locations = LocationModel.values;

  List<LocationModel> priority2Locations = LocationModel.values;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.current.desiredPathway,
              style: textTheme.displaySmall?.copyWith(
                color: colorScheme.onBackground,
              ),
            ),
            Text(
              "*",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Colors.red,
                  ),
            ),
          ],
        ),
        Text(
          S.current.desiredPathwayHelperText,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onBackground.withOpacity(0.5),
            fontStyle: FontStyle.italic,
          ),
        ),
        8.hSpace,
        CustomDropdown(
          items: const [
            InternshipRole.sales,
            InternshipRole.procurement,
            InternshipRole.itDataAnalyst,
            InternshipRole.tradeMarketing,
            InternshipRole.rtm,
            InternshipRole.keyAccountOnPremise,
            InternshipRole.keyAccountOffPremise,
          ],
          readOnly: true,
          onSelect: (value) {
            // if (role != value) {
            //   role = value;

            //   if (role != InternshipRole.sales) {
            //     priority1 = LocationModel.hochiminh;
            //     priority2 = null;
            //     willingToReallocate = null;
            //   } else {
            //     priority1 = null;
            //     willingToReallocate = true;
            //     priority2Locations = locations;
            //   }
            //   widget.onChangeRole.call(role);
            //   widget.onChangeLocationPriority1.call(priority1);
            //   widget.onChangeLocationPriority2.call(priority2);
            //   widget.onChangeWillingToAllocate.call(willingToReallocate);
            //   setState(() {});
            // }
          },
          value: role,
          required: true,
          validator: (value) {
            if (value == null) {
              return S.current.inputRequired;
            }
            return null;
          },
        ),
        16.hSpace,
        role == InternshipRole.sales
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          value: priority1,
                          items: priority1Locations,
                          validator: (value) {
                            if (value == null) {
                              return S.current.inputRequired;
                            }
                            return null;
                          },
                          onSelect: (value) {
                            if (priority1 != value) {
                              priority1 = value;
                              if (priority2 == value) {
                                priority2 = null;
                              }
                              priority2Locations = locations.where((element) => element != priority1).toList();

                              widget.onChangeLocationPriority1.call(priority1);
                              widget.onChangeLocationPriority2.call(priority2);
                              setState(() {});
                            }
                          },
                          label: '${S.current.workingLocation} - ${S.current.priority1}',
                          required: true,
                        ),
                      ),
                      16.wSpace,
                      Expanded(
                        child: CustomDropdown(
                          value: priority2,
                          items: priority2Locations,
                          validator: (value) {
                            if (value == null) {
                              return S.current.inputRequired;
                            }
                            return null;
                          },
                          onSelect: (value) {
                            widget.onChangeLocationPriority2.call(priority2);
                            priority2 = value;
                          },
                          label: '${S.current.workingLocation} - ${S.current.priority2}',
                          required: true,
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
                  ReallocateOption(onChange: (value) {
                    willingToReallocate = value;
                    widget.onChangeWillingToAllocate(value);
                  })
                ],
              )
            : role == null
                ? const SizedBox.shrink()
                : Text(
                    S.current.workAtHCMHeadOffice,
                    style: textTheme.bodyLarge,
                  ),
      ],
    );
  }
}

class ReallocateOption extends StatefulWidget {
  final void Function(bool value) onChange;
  const ReallocateOption({super.key, required this.onChange});

  @override
  State<ReallocateOption> createState() => _ReallocateOptionState();
}

class _ReallocateOptionState extends State<ReallocateOption> {
  bool willingToReallocate = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      children: [
        Radio(
          value: true,
          groupValue: willingToReallocate,
          onChanged: (value) {
            willingToReallocate = true;
            widget.onChange.call(willingToReallocate);
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
            widget.onChange.call(willingToReallocate);
            setState(() {});
          },
        ),
        Text(
          S.current.no,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
