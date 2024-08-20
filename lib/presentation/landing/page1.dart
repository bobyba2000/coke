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
      physics: CustomPageScrollPhysics(),
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

  final List<double> stops = [
    700.w,
    1600.w,
    2400.w,
    3200.w,
  ];

  @override
  CustomPageScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageScrollPhysics(parent: buildParent(ancestor));
  }

  double _getTargetPixels(ScrollMetrics position, Tolerance tolerance, double velocity) {
    double ratio = 0;
    int index = 0;
    for (var i = 0; i < stops.length; i++) {
      final stop = stops[i];
      index = i;
      if (position.pixels < stop) {
        ratio = (position.pixels - stop) / (stop - (i == 0 ? 0 : stops[i - 1]));
        break;
      }
    }

    if (velocity < -tolerance.velocity) {
      ratio -= 0.5;
    } else if (velocity > tolerance.velocity) {
      ratio += 0.5;
    }
    int trueIndex = ((index + ratio).roundToDouble()).toInt();
    if (trueIndex >= stops.length) {
      return stops.last;
    }
    if (trueIndex < -1) {
      return stops.first;
    }
    return stops[trueIndex];
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) || (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = toleranceFor(position);
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity, tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
