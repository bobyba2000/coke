import 'dart:typed_data';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttachmentWidget extends StatefulWidget {
  const AttachmentWidget({super.key});

  @override
  State<AttachmentWidget> createState() => _AttachmentWidgetState();
}

class _AttachmentWidgetState extends State<AttachmentWidget> {
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
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.personalResume,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "*",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                ),
              ],
            ),
            8.hSpace,
            Container(
              decoration: BoxDecoration(
                color: colorScheme.background,
                border: Border.all(
                  color: theme.dividerColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              height: 150.h,
              child: Stack(
                children: [
                  DropzoneView(
                    operation: DragOperation.copy,
                    cursor: CursorType.grab,
                    onDrop: (value) {},
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.current.uploadDropFile,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.5),
                          ),
                        ),
                        2.hSpace,
                        Text(
                          S.current.cvHelperText,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.5),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        24.h.hSpace,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.accomplishmentRecords,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            8.hSpace,
            Container(
              decoration: BoxDecoration(
                color: colorScheme.background,
                border: Border.all(
                  color: theme.dividerColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              height: 150.h,
              child: Stack(
                children: [
                  DropzoneView(
                    operation: DragOperation.copy,
                    cursor: CursorType.grab,
                    onDrop: (value) {},
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.current.uploadDropFile,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.5),
                          ),
                        ),
                        2.hSpace,
                        Text(
                          S.current.cvHelperText,
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onBackground.withOpacity(0.5),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      // Upload file
      // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
    }
  }
}
