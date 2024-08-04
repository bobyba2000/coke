// ignore_for_file: use_build_context_synchronously

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/loading_utility.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

enum SettingType {
  logout,
  changePassword;
}

class SettingProfileWidget extends StatelessWidget with Validator {
  const SettingProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () => changePassword(context),
          child: Text(
            S.current.changePassword,
          ),
        ),
        PopupMenuItem(
          onTap: () => logout(context),
          child: Text(
            S.current.signOut,
          ),
        ),
      ],
      tooltip: 'Settings',
      child: const Icon(
        Icons.settings,
      ),
    );
  }

  void logout(BuildContext context) {
    final authService = AppDependencies.injector.get<FirebaseAuthService>();
    authService.logout().then((value) {
      context.go('/login');
    });
  }

  void changePassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          final form = GlobalKey<FormState>();
          String password = '';
          return AlertDialog(
            title: Text(
              S.current.changePassword,
              style: TextStyle(fontSize: 26.sp, color: Colors.red),
            ),
            content: SizedBox(
              width: 600.w,
              child: Form(
                key: form,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFieldWidget(
                      label: S.current.newPassword,
                      fillColor: Colors.white,
                      filled: true,
                      obscureText: true,
                      validator: checkRequired,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    24.hSpace,
                    TextFieldWidget(
                      label: S.current.confirmPassword,
                      fillColor: Colors.white,
                      filled: true,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value == '') {
                          return S.current.inputRequired;
                        }
                        if (value != password) {
                          return 'Your confirm password is not correct';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(S.current.cancel),
              ),
              TextButton(
                onPressed: () async {
                  if (form.currentState!.validate()) {
                    final authService = AppDependencies.injector.get<FirebaseAuthService>();
                    LoadingUtility.show();
                    try {
                      await authService.changePassword(password);
                      Navigator.pop(context);
                    } catch (e) {
                      Logger().e(e);
                    } finally {
                      LoadingUtility.dismiss();
                    }
                  }
                },
                child: Text(
                  S.current.confirm,
                ),
              ),
            ],
          );
        });
  }
}
