import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ApplyNowButton extends StatefulWidget {
  const ApplyNowButton({super.key});

  @override
  State<ApplyNowButton> createState() => _ApplyNowButtonState();
}

class _ApplyNowButtonState extends State<ApplyNowButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return InkWell(
      hoverColor: Colors.transparent,
      onHover: (value) {
        isHover = value;
        setState(() {});
      },
      onTap: () {
        context.go('/apply');
      },
      child: SizedBox(
        width: 170,
        child: Stack(
          alignment: Alignment.center,
          children: [
            isHover ? Assets.images.applyNowActive.image() : Assets.images.applyNow.image(),
            Positioned(
              left: 60,
              top: 25,
              child: Text(
                S.current.applyNow,
                style: textTheme.bodyMedium?.copyWith(
                  color: isHover ? Colors.white : colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
