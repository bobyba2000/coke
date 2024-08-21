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
          borderRadius: BorderRadius.circular(8.r),
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: role.color,
              width: 175.w,
              height: 95.w,
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    role.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: role.foregroundColor,
                      fontSize: 16.spMin,
                    ),
                  ),
                  4.wMin.hSpace,
                  Text(
                    role.subtitle,
                    style: TextStyle(
                      color: role.foregroundColor,
                      fontSize: 10.spMin,
                    ),
                  ),
                  if ((role.content ?? '').isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(
                        top: 4.wMin,
                      ),
                      child: Text(
                        role.content ?? '',
                        style: TextStyle(
                          color: role.foregroundColor,
                          fontSize: 8.spMin,
                          fontStyle: FontStyle.italic,
                        ),
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
    var firstEndPoint = Offset(size.width / 2, 12.w);

    var secondControlPoint = Offset(3 * size.width / 4, 24.w);
    var secondEndPoint = Offset(size.width, 12.w);

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
            top: 250.w,
            left: 500.w,
            right: 500.w,
            child: Assets.images.career.model.image(
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 400.w,
            right: 400.w,
            top: 80.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  S.current.careerDesired.toUpperCase(),
                  style: textTheme.displaySmall?.copyWith(
                    color: const Color(0xFFBA5D1B),
                    fontSize: 45.sp,
                  ),
                ),
                8.w.hSpace,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: S.current.careerDesiredSubtitle1,
                    style: textTheme.bodyLarge?.copyWith(
                      color: const Color(0xFFBA5D1B),
                      fontSize: 16.sp,
                    ),
                    children: [
                      TextSpan(
                        text: S.current.careerDesiredSubtitle2,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
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
            top: 200.w,
            child: const WaveContainer(
              role: InternshipRole.sales,
            ),
          ),
          Positioned(
            right: 100.w,
            top: 200.w,
            child: const WaveContainer(
              role: InternshipRole.procurement,
            ),
          ),
          Positioned(
            left: 150.w,
            top: 350.w,
            child: const WaveContainer(
              role: InternshipRole.tradeMarketing,
            ),
          ),
          Positioned(
            right: 150.w,
            top: 350.w,
            child: const WaveContainer(
              role: InternshipRole.rtm,
            ),
          ),
          Positioned(
            left: 200.w,
            top: 500.w,
            child: const WaveContainer(
              role: InternshipRole.itDataAnalyst,
            ),
          ),
          Positioned(
            right: 200.w,
            top: 500.w,
            child: const WaveContainer(
              role: InternshipRole.itPrivacy,
            ),
          ),
          Positioned(
            left: 250.w,
            top: 650.w,
            child: const WaveContainer(
              role: InternshipRole.keyAccountOnPremise,
            ),
          ),
          Positioned(
            right: 250.w,
            top: 650.w,
            child: const WaveContainer(
              role: InternshipRole.keyAccountOffPremise,
            ),
          ),
        ],
      ),
    );
  }
}
