import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/presentation/admin/appbar/widget.dart';
import 'package:coke_platform/presentation/application/background/widget.dart';
import 'package:flutter/material.dart';

class ContestantPage extends StatefulWidget {
  const ContestantPage({super.key});

  @override
  State<ContestantPage> createState() => _ContestantPageState();
}

class _ContestantPageState extends State<ContestantPage> {
  @override
  Widget build(BuildContext context) {
    return Title(
      color: Colors.white,
      title: 'Your info',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminAppbarWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const BackgroundImage(),
                    45.hSpace,
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
