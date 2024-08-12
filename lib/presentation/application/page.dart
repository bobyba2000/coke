import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/dialog.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/application/appbar/widget.dart';
import 'package:coke_platform/presentation/application/background/widget.dart';
import 'package:coke_platform/presentation/application/form/widget.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        DialogUtility.showLanguagePicker(
          context,
          title: S.current.languagePickerApplyPage,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.white,
      title: 'Apply Now',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ApplicationAppbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BackgroundImage(),
                    45.hSpace,
                    const ApplyFormWidget(),
                    64.hMax.hSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
