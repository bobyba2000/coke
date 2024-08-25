import 'dart:async';

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:sprintf/sprintf.dart';

import '../footer/widget.dart';

class MobileCountdownWidget extends StatefulWidget {
  final ScrollController controller;
  final GlobalKey overview;
  final GlobalKey about;
  final GlobalKey essence;
  final GlobalKey career;
  final GlobalKey journey;
  final GlobalKey progress;
  const MobileCountdownWidget({
    super.key,
    required this.controller,
    required this.overview,
    required this.about,
    required this.essence,
    required this.career,
    required this.journey,
    required this.progress,
  });

  @override
  State<MobileCountdownWidget> createState() => _MobileCountdownWidgetState();
}

class _MobileCountdownWidgetState extends State<MobileCountdownWidget> with AutomaticKeepAliveClientMixin {
  DateTime dueDate = DateTime(2024, 9, 16, 23, 59, 59);
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
    if (value < 10) {
      return '0$value';
    }
    return '$value';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final seconds = duration.inSeconds % 60;
    final minutes = duration.inMinutes % 60;
    final hours = duration.inHours % 24;
    final days = duration.inDays;

    return Container(
      color: const Color(0xFF31cccc),
      width: 1400.w,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              sprintf(
                S.current.onlyDaysLeft,
                [to2DigitString(days)],
              ).toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            60.w.hSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                timeBox(
                  days,
                  S.current.days,
                ),
                16.wSpace,
                timeBox(
                  hours,
                  S.current.hours,
                ),
                16.wSpace,
                timeBox(
                  minutes,
                  S.current.minutes,
                ),
                16.wSpace,
                timeBox(
                  seconds,
                  S.current.seconds,
                ),
              ],
            ),
            24.hSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFilledButton(
                  title: S.current.applyNow,
                  onTap: () {
                    context.go('/apply');
                  },
                ),
              ],
            ),
            24.hSpace,
            Stack(
              children: [
                Assets.images.countdown.bottom.image(
                  width: 1400.w,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: MobileFooterWidget(
                    controller: widget.controller,
                    overview: widget.overview,
                    about: widget.about,
                    essence: widget.essence,
                    career: widget.career,
                    journey: widget.journey,
                    progress: widget.progress,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget timeBox(
    int value,
    String title,
  ) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
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
                fontSize: 24,
                color: Color(0xFF049999),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        8.hSpace,
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF083A3A),
          ),
        ),
      ],
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
