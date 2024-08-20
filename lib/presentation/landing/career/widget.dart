import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaveContainer extends StatefulWidget {
  final InternshipRole role;
  const WaveContainer({
    super.key,
    required this.role,
  });

  @override
  State<WaveContainer> createState() => _WaveContainerState();
}

class _WaveContainerState extends State<WaveContainer> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final role = widget.role;
    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      onTap: role.showDialog,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isHover
              ? [
                  BoxShadow(
                    color: role.color.withOpacity(0.5),
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
              color: role.color,
              width: 250.w,
              height: 120.w,
              padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    role.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.spMin,
                    ),
                  ),
                  4.hSpace,
                  Text(
                    role.subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.spMin,
                    ),
                  ),
                  4.hSpace,
                  Text(
                    role.content ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.spMin,
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
      height: 800.w,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.career.background.image(
            width: 1400.w,
            height: 800.w,
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
            child: const WaveContainer(
              role: InternshipRole.sales,
            ),
          ),
          Positioned(
            right: 100.w,
            top: 150.w,
            child: const WaveContainer(
              role: InternshipRole.procurement,
            ),
          ),
          Positioned(
            left: 150.w,
            top: 300.w,
            child: const WaveContainer(
              role: InternshipRole.tradeMarketing,
            ),
          ),
          Positioned(
            right: 150.w,
            top: 300.w,
            child: const WaveContainer(
              role: InternshipRole.rtm,
            ),
          ),
          Positioned(
            left: 200.w,
            top: 450.w,
            child: const WaveContainer(
              role: InternshipRole.itDataAnalyst,
            ),
          ),
          Positioned(
            right: 200.w,
            top: 450.w,
            child: const WaveContainer(
              role: InternshipRole.itPrivacy,
            ),
          ),
          Positioned(
            left: 250.w,
            top: 600.w,
            child: const WaveContainer(
              role: InternshipRole.keyAccountOnPremise,
            ),
          ),
          Positioned(
            right: 250.w,
            top: 600.w,
            child: const WaveContainer(
              role: InternshipRole.keyAccountOffPremise,
            ),
          ),
        ],
      ),
    );
  }
}
