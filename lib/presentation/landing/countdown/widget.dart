import 'dart:async';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:sprintf/sprintf.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> with AutomaticKeepAliveClientMixin {
  DateTime dueDate = DateTime(2024, 9, 30);
  Duration duration = const Duration();
  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration = dueDate.difference(DateTime.now());
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  String to2DigitString(int value) {
    if (value < 9) {
      return '0$value';
    }
    return '$value';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final seconds = duration.inSeconds % 60;
    final minutes = duration.inMinutes % 60;
    final hours = duration.inHours % 60;
    final days = duration.inDays % 60;

    return SizedBox(
      height: 900.h,
      width: 1400.w,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              sprintf(
                S.current.onlyDaysLeft,
                [to2DigitString(days)],
              ),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 45.sp,
                color: Colors.white,
              ),
            ),
            60.h.hSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                timeBox(days),
                32.w.wSpace,
                timeBox(hours),
                32.wSpace,
                timeBox(minutes),
                32.w.wSpace,
                timeBox(seconds),
              ],
            ),
            60.h.hSpace,
            CustomFilledButton(
              title: S.current.applyNow,
              onTap: () {
                context.go('/apply');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget timeBox(int value) {
    return Container(
      height: 170,
      width: 170,
      color: const Color(0xFF074343),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF099A9A),
            width: 1.5,
          ),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: SpinnerText(
          text: to2DigitString(value),
          textStyle: const TextStyle(
            fontSize: 64,
            color: Color(0xFF049999),
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
