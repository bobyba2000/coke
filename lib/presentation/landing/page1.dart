// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomScrollWidget extends StatelessWidget {
  final List<Widget> children;
  final ScrollController controller;
  const CustomScrollWidget({
    super.key,
    required this.children,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      physics: 1400.w * 1.5 < 900.h ? null : CustomPageScrollPhysics(),
      child: ChangeNotifierProvider(
        create: (context) => controller,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}

class CustomPageScrollPhysics extends PageScrollPhysics {
  CustomPageScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  double beforePos = 0;
  final List<double> stops = [
    800.w,
    1700.w,
    2500.w,
    3350.w,
    4150.w,
    4850.w,
    5650.w,
    6450.w,
    7250.w,
    7700.w,
  ];

  @override
  CustomPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageScrollPhysics(parent: buildParent(ancestor));
  }

  double _getTargetPixels(
    ScrollMetrics position,
    Tolerance tolerance,
    double velocity,
    AxisDirection direction,
  ) {
    bool isScrollDown = position.pixels > beforePos;
    if (isScrollDown) {
      double ratio = 0;
      int index = -1;
      for (var i = 0; i < stops.length; i++) {
        final stop = stops[i];
        if (position.pixels <= stop) {
          ratio =
              (stop - position.pixels) / (stop - (i == 0 ? 0 : stops[i - 1]));
          break;
        }
        index = i;
      }
      int trueIndex = index;
      if (isScrollDown) {
        ratio += 0.5;
      } else {
        ratio -= 0.5;
      }
      trueIndex = ((index + ratio).roundToDouble()).toInt();
      if (trueIndex == index) {
        return position.pixels;
      }

      if (trueIndex >= stops.length) {
        return stops.last;
      }
      if (trueIndex < 0) {
        return 0;
      }
      return stops[trueIndex];
    }
    final pixels = position.pixels;
    int index = -1;
    double previousStop = 0;
    for (var i = 0; i < stops.length; i++) {
      final stop = stops[i];
      if (position.pixels < stop) {
        break;
      }
      index = i;
      previousStop = stop;
    }
    if (previousStop == pixels) {
      return pixels;
    }
    final trueIndex = index;

    if (trueIndex >= stops.length) {
      return stops.last;
    }
    if (trueIndex < 0) {
      return 0;
    }
    return stops[trueIndex];
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = toleranceFor(position);
    final double target = _getTargetPixels(
      position,
      tolerance,
      velocity,
      position.axisDirection,
    );

    beforePos = position.pixels;
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
