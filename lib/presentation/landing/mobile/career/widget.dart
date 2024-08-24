import 'package:coke_platform/common/extension/num_extension.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: InkWell(
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
            borderRadius: BorderRadius.circular(16),
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: role.color,
                height: 125,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ).copyWith(
                  top: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      role.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: role.foregroundColor,
                        fontSize: 18,
                      ),
                    ),
                    4.wMin.hSpace,
                    Text(
                      role.subtitle,
                      style: TextStyle(
                        color: role.foregroundColor,
                        fontSize: 14,
                      ),
                    ),
                    if ((role.content ?? '').isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 4,
                        ),
                        child: Text(
                          role.content ?? '',
                          style: TextStyle(
                            color: role.foregroundColor,
                            fontSize: 10,
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
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start at the top left
    path.moveTo(0, 30);

    // Create a smoother wave-like curve at the top border
    var firstControlPoint = Offset(size.width / 4, 0);
    var firstEndPoint = Offset(size.width / 2, 24);

    var secondControlPoint = Offset(3 * size.width / 4, 48);
    var secondEndPoint = Offset(size.width, 24);

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
          Text(
            S.current.careerDesired.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFFBA5D1B),
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          8.w.hSpace,
          SelectableText.rich(
            TextSpan(
              text: S.current.careerDesiredSubtitle1,
              style: TextStyle(
                color: const Color(0xFFBA5D1B),
                fontSize: 16,
                height: 1.3.wMax,
              ),
              children: [
                TextSpan(
                  text: S.current.careerDesiredSubtitle2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.sales,
                ),
              ),
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.procurement,
                ),
              ),
            ],
          ),
          16.hSpace,
          Row(
            children: [
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.tradeMarketing,
                ),
              ),
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.rtm,
                ),
              ),
            ],
          ),
          16.hSpace,
          Row(
            children: [
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.itDataAnalyst,
                ),
              ),
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.itPrivacy,
                ),
              ),
            ],
          ),
          16.hSpace,
          Row(
            children: [
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.keyAccountOnPremise,
                ),
              ),
              16.wSpace,
              const Expanded(
                child: WaveContainer(
                  role: InternshipRole.keyAccountOffPremise,
                ),
              ),
            ],
          ),
          24.hSpace,
        ],
      ),
    );
  }
}
