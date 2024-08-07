// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

enum LanguageType {
  vietnam,
  england;

  @override
  String toString() {
    switch (this) {
      case LanguageType.vietnam:
        return 'Việt Nam';
      case LanguageType.england:
        return 'England';
    }
  }

  Widget get icon {
    switch (this) {
      case LanguageType.vietnam:
        return Assets.images.vi.image();
      case LanguageType.england:
        return Assets.images.en.image();
    }
  }
}

class LanguageSwitch extends StatelessWidget {
  final bool needToRefresh;
  const LanguageSwitch({super.key,  this.needToRefresh  = false});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocaleUtility.locale,
      builder: (BuildContext context, Locale value, Widget? child) {
        final data = value.languageCode == 'vi' ? LanguageType.vietnam : LanguageType.england;
        return PopupMenuButton(
          itemBuilder: (context) => LanguageType.values
              .map(
                (e) => PopupMenuItem(
                  onTap: () {
                    final languageCode = e == LanguageType.vietnam ? 'vi' : 'en';
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
                        width: 30,
                        height: 30,
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
