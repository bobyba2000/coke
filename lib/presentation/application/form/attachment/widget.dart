import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/custom_dropdown.dart';
import 'package:coke_platform/common/widget/field/file_dropzone.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/other/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttachmentViewModel {
  final FileModel resume;
  final FileModel? accomplishment;
  final ContestantOtherModel other;

  AttachmentViewModel({
    required this.resume,
    required this.accomplishment,
    required this.other,
  });
}

class AttachmentWidget extends StatefulWidget {
  final Function(AttachmentViewModel attachment) onFinish;
  final VoidCallback onBack;
  const AttachmentWidget({super.key, required this.onFinish, required this.onBack});

  @override
  State<AttachmentWidget> createState() => _AttachmentWidgetState();
}

class _AttachmentWidgetState extends State<AttachmentWidget> with Validator {
  FileModel? resume;
  FileModel? accomplishment;
  bool submitRecommendation = false;
  ProgramChannel? channel;
  final form = GlobalKey<FormState>();

  final channels = ProgramChannel.values;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.attachment,
          style: textTheme.displayLarge?.copyWith(
            color: colorScheme.onBackground,
          ),
        ),
        64.h.hSpace,
        FileDropzoneField(
          label: S.current.personalResume,
          required: true,
          onChange: (value) {
            resume = value;
            setState(() {});
          },
        ),
        16.hSpace,
        FileDropzoneField(
          label: S.current.accomplishmentRecords,
          helperText: S.current.accomplishmentHelperText,
          onChange: (value) {
            accomplishment = value;
          },
        ),
        64.h.hSpace,
        Text(
          S.current.others,
          style: textTheme.displayLarge?.copyWith(
            color: colorScheme.onBackground,
          ),
        ),
        64.h.hSpace,
        Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SubmitRecommendationOption(
              //   onChange: (value) {
              //     submitRecommendation = value;
              //   },
              // ),
              // 16.hSpace,
              CustomDropdown(
                items: channels,
                label: S.current.hearProgramFrom,
                value: channel,
                validator: checkRequired,
                onSelect: (value) {
                  channel = value;
                },
                required: true,
                maxHeight: 200,
              ),
            ],
          ),
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
              enabled: resume != null,
              title: S.current.continueWord,
              onTap: () {
                if (resume != null && form.currentState!.validate()) {
                  widget.onFinish.call(
                    AttachmentViewModel(
                      resume: resume!,
                      accomplishment: accomplishment,
                      other: ContestantOtherModel(
                        submitRecommendation: submitRecommendation,
                        hearFrom: channel!,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

class SubmitRecommendationOption extends StatefulWidget {
  final void Function(bool value) onChange;
  const SubmitRecommendationOption({super.key, required this.onChange});

  @override
  State<SubmitRecommendationOption> createState() => _SubmitRecommendationOptionState();
}

class _SubmitRecommendationOptionState extends State<SubmitRecommendationOption> {
  bool submitRecommendation = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.current.submitRecommendationLetter,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "*",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red),
            ),
          ],
        ),
        8.hSpace,
        Row(
          children: [
            Radio(
              value: true,
              groupValue: submitRecommendation,
              onChanged: (value) {
                submitRecommendation = true;
                widget.onChange.call(submitRecommendation);
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
              groupValue: submitRecommendation,
              onChanged: (value) {
                submitRecommendation = false;
                widget.onChange.call(submitRecommendation);
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
    );
  }
}
