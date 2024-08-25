import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: InkWell(
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        onTap: () {
          SmartDialog.show(
            maskColor: Colors.black87,
            builder: (context) {
              return Container(
                constraints: BoxConstraints(
                  maxHeight: 700.h - 40,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: role.color,
                ),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      role.title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: role.foregroundColor,
                      ),
                    ),
                    4.hSpace,
                    Text(
                      '${role.subtitle} ${role.content ?? ''}'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: role.foregroundColor,
                      ),
                    ),
                    Divider(
                      color: role.foregroundColor,
                      thickness: 1,
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            role.overview(),
                            6.hSpace,
                            role.responsibilities(),
                            6.hSpace,
                            RichText(
                              text: TextSpan(
                                text: '${S.current.note}: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  color: role.foregroundColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: role.note,
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 10,
                                      color: role.foregroundColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
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
            borderRadius: BorderRadius.circular(8),
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: role.color,
                height: 60,
                width: 360.w,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ).copyWith(
                  top: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      role.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: role.foregroundColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      role.subtitle,
                      style: TextStyle(
                        color: role.foregroundColor,
                        fontSize: 6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if ((role.content ?? '').isNotEmpty)
                      Text(
                        role.content ?? '',
                        style: TextStyle(
                          color: role.foregroundColor,
                          fontSize: 6,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      )
                  ],
                ),
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
    path.moveTo(0, 15);

    // Create a smoother wave-like curve at the top border
    var firstControlPoint = Offset(size.width / 4, 0);
    var firstEndPoint = Offset(size.width / 2, 12);

    var secondControlPoint = Offset(3 * size.width / 4, 24);
    var secondEndPoint = Offset(size.width, 12);

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

class MobileCareerWidget extends StatelessWidget {
  const MobileCareerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400.w,
      color: const Color(0xFFf1feff),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.images.career.model.image(
            width: 800.w,
            fit: BoxFit.fitWidth,
          ),
          40.hSpace,
          Text(
            S.current.careerDesired.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFFBA5D1B),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          12.hSpace,
          SelectableText.rich(
            TextSpan(
              text: S.current.careerDesiredSubtitle1,
              style: TextStyle(
                color: const Color(0xFFBA5D1B),
                fontSize: 10,
                height: 1.3.wMax,
              ),
              children: [
                TextSpan(
                  text: S.current.careerDesiredSubtitle2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    height: 1.3.wMax,
                    color: const Color(0xFFBA5D1B),
                  ),
                ),
                TextSpan(
                  text: S.current.careerDesiredSubtitle3,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          16.hSpace,
          Row(
            children: [
              const Spacer(),
              const WaveContainer(
                role: InternshipRole.sales,
              ),
              50.w.wSpace,
              const WaveContainer(
                role: InternshipRole.procurement,
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              const WaveContainer(
                role: InternshipRole.tradeMarketing,
              ),
              50.w.wSpace,
              const WaveContainer(
                role: InternshipRole.itDataAnalyst,
              ),
              50.w.wSpace,
              const WaveContainer(
                role: InternshipRole.itPrivacy,
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              const WaveContainer(
                role: InternshipRole.rtm,
              ),
              50.w.wSpace,
              const WaveContainer(
                role: InternshipRole.keyAccountOnPremise,
              ),
              50.w.wSpace,
              const WaveContainer(
                role: InternshipRole.keyAccountOffPremise,
              ),
              const Spacer(),
            ],
          ),
          24.hSpace,
        ],
      ),
    );
  }
}
