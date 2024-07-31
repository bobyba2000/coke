import 'package:coke_platform/config/firebase.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/core/router/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/utility/locale.dart';
import 'core/layout/theme.dart';
import 'generated/l10n.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseConfig.init();
  AppDependencies.init();
  await ScreenUtil.ensureScreenSize();
  LocaleUtility.getLocale().then((value) {
    LocaleUtility.locale.value = Locale(value);
  });
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LocaleUtility.locale,
      builder: (BuildContext context, Locale value, Widget? child) {
        return ScreenUtilInit(
          designSize: const Size(
            1400,
            900,
          ),
          builder: (context, child) {
            return MaterialApp.router(
              routerConfig: AppRouter.router,
              scrollBehavior: MyCustomScrollBehavior(),
              debugShowCheckedModeBanner: false,
              theme: themeData(context),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: value,
              builder: EasyLoading.init(),
              supportedLocales: S.delegate.supportedLocales,
            );
          },
        );
      },
    );
  }
}
