// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';
import 'dart:typed_data';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FileModel {
  final Uint8List bytes;
  final String fileName;

  FileModel({
    required this.bytes,
    required this.fileName,
  });
}

class FileDropzoneField extends StatefulWidget {
  final String? label;
  final bool required;
  final Function(FileModel? file) onChange;
  final String? helperText;
  const FileDropzoneField({
    super.key,
    this.label,
    this.required = false,
    required this.onChange,
    this.helperText,
  });

  @override
  State<FileDropzoneField> createState() => _FileDropzoneFieldState();
}

class _FileDropzoneFieldState extends State<FileDropzoneField> {
  FileModel? file;
  late DropzoneViewController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label ?? '',
                  style: textTheme.displaySmall?.copyWith(
                    color: colorScheme.onBackground,
                  ),
                ),
                if (widget.required)
                  Text(
                    "*",
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ),
        Builder(builder: (context) {
          if (file != null) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(0, 1),
                    blurRadius: 4,
                  )
                ],
              ),
              padding: EdgeInsets.only(
                left: 30.w,
                top: 16.h,
                bottom: 16.h,
                right: 30.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      file!.fileName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        file = null;
                      });

                      widget.onChange.call(file);
                    },
                    icon: Icon(
                      Icons.close,
                      color: colorScheme.onBackground.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            );
          }
          return DottedBorder(
            dashPattern: const [5, 5],
            color: theme.dividerColor,
            radius: Radius.circular(16.r),
            child: SizedBox(
              width: double.infinity,
              height: 150.h,
              child: Stack(
                children: [
                  DropzoneView(
                    mime: const ['pdf'],
                    onCreated: (DropzoneViewController ctrl) => controller = ctrl,
                    operation: DragOperation.copy,
                    cursor: CursorType.grab,
                    onDrop: (value) {
                      final htmlFile = (value as File);
                      controller.getFileData(htmlFile).then((value) {
                        file = FileModel(bytes: value, fileName: htmlFile.name);
                        widget.onChange.call(file!);
                        setState(() {});
                      });
                    },
                  ),
                  Center(
                    child: TextButton(
                      onPressed: uploadFile,
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
                            widget.helperText ?? S.current.cvHelperText,
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onBackground.withOpacity(0.5),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          8.hSpace,
                          Icon(
                            Icons.cloud_upload_outlined,
                            color: colorScheme.onBackground.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;
      file = FileModel(bytes: fileBytes, fileName: fileName);
      widget.onChange.call(file!);
      setState(() {});
    }
  }
}
