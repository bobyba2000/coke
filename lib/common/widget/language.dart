// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:flutter_screenutil/flutter_screenutil.dart';

enum LanguageType {
  vietnamese,
  english;

  @override
  String toString() {
    switch (this) {
      case LanguageType.vietnamese:
        return 'Tiếng Việt';
      case LanguageType.english:
        return 'English';
    }
  }

  Widget get icon {
    switch (this) {
      case LanguageType.vietnamese:
        return Assets.images.vi.image(
          width: 30.w,
          fit: BoxFit.fitWidth,
        );
      case LanguageType.english:
        return Assets.images.en.image(
          width: 30.w,
          fit: BoxFit.fitWidth,
        );
    }
  }
}

class LanguageSwitch extends StatelessWidget {
  final bool needToRefresh;
  const LanguageSwitch({super.key, this.needToRefresh = true});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocaleUtility.locale,
      builder: (BuildContext context, Locale value, Widget? child) {
        final data = value.languageCode == 'vi'
            ? LanguageType.vietnamese
            : LanguageType.english;
        return PopupMenuButton(
          tooltip: S.current.languageTooltip,
          itemBuilder: (context) => LanguageType.values
              .map(
                (e) => PopupMenuItem(
                  onTap: () {
                    final languageCode =
                        e == LanguageType.vietnamese ? 'vi' : 'en';
                    LocaleUtility.saveLocale(languageCode);
                    LocaleUtility.locale.value = Locale(languageCode);
                    if (needToRefresh) {
                      html.window.location.reload();
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: e.icon,
                      ),
                      8.wSpace,
                      Text(
                        e.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          icon: data.icon,
        );
      },
    );
  }
}
