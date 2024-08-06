import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/widget/button/outlined.dart';
import 'package:coke_platform/common/widget/field/file_dropzone.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttachmentViewModel {
  final FileModel resume;
  final FileModel? accomplishment;

  AttachmentViewModel({
    required this.resume,
    required this.accomplishment,
  });
}

class AttachmentWidget extends StatefulWidget {
  final Function(AttachmentViewModel attachment) onFinish;
  final VoidCallback onBack;
  const AttachmentWidget({super.key, required this.onFinish, required this.onBack});

  @override
  State<AttachmentWidget> createState() => _AttachmentWidgetState();
}

class _AttachmentWidgetState extends State<AttachmentWidget> {
  FileModel? resume;
  FileModel? accomplishment;
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
                if (resume != null) {
                  widget.onFinish.call(
                    AttachmentViewModel(
                      resume: resume!,
                      accomplishment: accomplishment,
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
