import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class MobileAppbar extends StatefulWidget implements PreferredSizeWidget {
  const MobileAppbar({super.key});

  @override
  State<MobileAppbar> createState() => _MobileAppbarState();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

class _MobileAppbarState extends State<MobileAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.center,
      color: Colors.white,
      child: Row(
        children: [
          16.wSpace,
          Assets.images.logo.image(
            height: 32,
          ),
          const Spacer(),
          const LanguageSwitch(),
          InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 32,
                color: Colors.black,
              )),
          16.wSpace,
        ],
      ),
    );
  }
}
