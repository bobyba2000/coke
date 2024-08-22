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
      physics: 1400.w < 500 ? null : CustomPageScrollPhysics(),
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
    1600.w,
    2500.w,
    3300.w,
    4100.w,
    4800.w,
    5600.w,
    6400.w,
    7200.w,
    7650.w,
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
    double ratio = 0;
    int index = -1;
    bool isScrollDown = position.pixels > beforePos;
    for (var i = 0; i < stops.length; i++) {
      final stop = stops[i];
      if (position.pixels <= stop) {
        ratio = (stop - position.pixels) / (stop - (i == 0 ? 0 : stops[i - 1]));
        break;
      }
      index = i;
    }
    int trueIndex = index;
    if (isScrollDown) {
      ratio += 0.5;
    } else {
      index += 1;
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
    // final previousPart = trueIndex == 0 ? 0 : stops[trueIndex - 1];
    // final height = stops[trueIndex] - previousPart;
    // if (height > 900.h && (stops[trueIndex] - position.pixels) / height < 0.5) {
    //   return position.pixels;
    // }
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
