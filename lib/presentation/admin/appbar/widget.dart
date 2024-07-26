import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminAppbarWidget extends StatefulWidget {
  const AdminAppbarWidget({super.key});

  @override
  State<AdminAppbarWidget> createState() => _AdminAppbarWidgetState();
}

class _AdminAppbarWidgetState extends State<AdminAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFfafbfc),
        boxShadow: [
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
      padding: EdgeInsets.only(
        left: 30.w,
        top: 16.h,
        bottom: 16.h,
        right: 30.w,
      ),
      child: Row(
        children: [
          Assets.images.logo.image(
            width: 160,
          ),
        ],
      ),
    );
  }
}
