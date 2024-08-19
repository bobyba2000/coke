import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class WaveContainer extends StatefulWidget {
  final String title;
  final String subTitle;
  final String? content;
  final VoidCallback onTap;
  final Color color;
  const WaveContainer({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.subTitle,
    this.content,
  });

  @override
  State<WaveContainer> createState() => _WaveContainerState();
}

class _WaveContainerState extends State<WaveContainer> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.5),
                    offset: const Offset(0, 7),
                    blurRadius: 29,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: widget.color,
              constraints: const BoxConstraints(minWidth: 200, minHeight: 95),
              width: 250,
              height: 120,
              padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  4.hSpace,
                  Text(
                    widget.subTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  4.hSpace,
                  Text(
                    widget.content ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start at the top left
    path.moveTo(0, 15.w);

    // Create a smoother wave-like curve at the top border
    var firstControlPoint = Offset(size.width / 4, 0);
    var firstEndPoint = Offset(size.width / 2, 15.w);

    var secondControlPoint = Offset(3 * size.width / 4, 30.w);
    var secondEndPoint = Offset(size.width, 15.w);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    // Draw lines down to the bottom right, then back to the bottom left
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CareerWidget extends StatelessWidget {
  const CareerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SizedBox(
      width: 1400.w,
      height: 780.w,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.career.background.image(
            width: 1400.w,
            height: 900.h,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 200.h,
            left: 457.w,
            right: 457.w,
            child: Assets.images.career.model.image(
              width: 486.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 300.w,
            right: 300.w,
            top: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.careerDesired,
                  style: textTheme.displaySmall?.copyWith(
                    color: const Color(0xFFBA5D1B),
                    fontSize: 38,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: S.current.careerDesiredSubtitle1,
                    style: textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFFBA5D1B),
                    ),
                    children: [
                      TextSpan(
                        text: S.current.careerDesiredSubtitle2,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFBA5D1B),
                        ),
                      ),
                      TextSpan(
                        text: S.current.careerDesiredSubtitle3,
                      ),
                    ],
                  ),
                ),
                40.hSpace,
              ],
            ),
          ),
          Positioned(
            left: 100.w,
            top: 150.w,
            child: WaveContainer(
              title: InternshipRole.sales.title,
              subTitle: InternshipRole.sales.subtitle,
              onTap: () {
                SmartDialog.show(
                  builder: (context) => InternshipRole.sales.background,
                );
              },
              color: InternshipRole.sales.color,
              content: InternshipRole.sales.content,
            ),
          ),
          Positioned(
            right: 100.w,
            top: 150.w,
            child: WaveContainer(
              title: InternshipRole.procurement.title,
              subTitle: InternshipRole.procurement.subtitle,
              onTap: () {},
              color: InternshipRole.procurement.color,
              content: InternshipRole.procurement.content,
            ),
          ),
          Positioned(
            left: 150.w,
            top: 300.w,
            child: WaveContainer(
              title: InternshipRole.tradeMarketing.title,
              subTitle: InternshipRole.tradeMarketing.subtitle,
              onTap: () {},
              color: InternshipRole.tradeMarketing.color,
              content: InternshipRole.tradeMarketing.content,
            ),
          ),
          Positioned(
            right: 150.w,
            top: 300.w,
            child: WaveContainer(
              title: InternshipRole.rtm.title,
              subTitle: InternshipRole.rtm.subtitle,
              onTap: () {},
              color: InternshipRole.rtm.color,
              content: InternshipRole.rtm.content,
            ),
          ),
          Positioned(
            left: 200.w,
            top: 450.w,
            child: WaveContainer(
              title: InternshipRole.itDataAnalyst.title,
              subTitle: InternshipRole.itDataAnalyst.subtitle,
              onTap: () {},
              color: InternshipRole.itDataAnalyst.color,
              content: InternshipRole.itDataAnalyst.content,
            ),
          ),
          Positioned(
            right: 200.w,
            top: 450.w,
            child: WaveContainer(
              title: InternshipRole.itPrivacy.title,
              subTitle: InternshipRole.itPrivacy.subtitle,
              onTap: () {},
              color: InternshipRole.itPrivacy.color,
              content: InternshipRole.itPrivacy.content,
            ),
          ),
          Positioned(
            left: 250.w,
            top: 600.w,
            child: WaveContainer(
              title: InternshipRole.keyAccountOnPremise.title,
              subTitle: InternshipRole.keyAccountOnPremise.subtitle,
              onTap: () {},
              color: InternshipRole.keyAccountOnPremise.color,
              content: InternshipRole.keyAccountOnPremise.content,
            ),
          ),
          Positioned(
            right: 250.w,
            top: 600.w,
            child: WaveContainer(
              title: InternshipRole.keyAccountOffPremise.title,
              subTitle: InternshipRole.keyAccountOffPremise.subtitle,
              onTap: () {},
              color: InternshipRole.keyAccountOffPremise.color,
              content: InternshipRole.keyAccountOffPremise.content,
            ),
          ),
        ],
      ),
    );
  }
}
