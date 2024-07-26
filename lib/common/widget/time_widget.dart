import 'dart:async';

import 'package:coke_platform/common/extension/datetime_extension.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  DateTime time = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        time = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      time.toUIDateString,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
