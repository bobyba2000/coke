import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CVListWidget extends StatefulWidget {
  const CVListWidget({super.key});

  @override
  State<CVListWidget> createState() => _CVListWidgetState();
}

class _CVListWidgetState extends State<CVListWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
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
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
            child: Text(
              S.current.cvList,
              style: textTheme.displaySmall,
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 16.h),
          )
        ],
      ),
    );
  }
}
