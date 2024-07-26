import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/constants/others.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewWidget extends StatefulWidget {
  final int totalCVs;
  const OverviewWidget({super.key, required this.totalCVs});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    double linearValue = widget.totalCVs * 1.0 / OthersConstant.maxCVCount;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: const Color.fromRGBO(26, 54, 126, 0.125),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.03),
            offset: Offset(0, 16 * 0.46875),
            blurRadius: 16 * 2.1875,
          ),
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.03),
            offset: Offset(0, 16 * 0.9375),
            blurRadius: 16 * 1.40625,
          ),
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.05),
            offset: Offset(0, 16 * 0.25),
            blurRadius: 16 * 0.53125,
          ),
          BoxShadow(
            color: Color.fromRGBO(4, 9, 20, 0.03),
            offset: Offset(0, 16 * 0.125),
            blurRadius: 16 * 0.1875,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.totalCVs,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    2.hSpace,
                    Text(
                      S.current.totalCVsSubmitted,
                      style: textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF6c757d),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.totalCVs.toStringWithSeperator(),
                style: textTheme.displayLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          8.hSpace,
          LinearProgressIndicator(
            value: linearValue > 1 ? 1 : linearValue,
            color: colorScheme.primary,
            minHeight: 10,
            backgroundColor: const Color(0xFFe9ecef),
            borderRadius: BorderRadius.circular(5),
          )
        ],
      ),
    );
  }
}
