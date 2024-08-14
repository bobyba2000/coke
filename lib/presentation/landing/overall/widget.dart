import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class LadingOverallWidget extends StatefulWidget {
  final double width;
  final double height;
  const LadingOverallWidget(
      {super.key, required this.width, required this.height});

  @override
  State<LadingOverallWidget> createState() => _LadingOverallWidgetState();
}

class _LadingOverallWidgetState extends State<LadingOverallWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: ColorConstants.teal,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.water1.image(
            width: widget.width,
            height: widget.height,
            fit: BoxFit.cover,
          ),
          Assets.images.water2.image(
            width: widget.width,
            height: widget.height,
            fit: BoxFit.cover,
          ),
          Assets.images.image1.image(
            width: widget.width,
            height: widget.height,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
