import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/appbar/widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LandingPageAppbar(),
        ],
      ),
    );
  }
}
