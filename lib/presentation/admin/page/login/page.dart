// ignore_for_file: use_build_context_synchronously

import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/loading_utility.dart';
import 'package:coke_platform/common/utility/validator.dart';
import 'package:coke_platform/common/widget/field/textfield_widget.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/constants/color.dart';
import 'package:coke_platform/core/dependencies/app_dependencies.dart';
import 'package:coke_platform/generated/assets.gen.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/presentation/landing/button/custom.dart';
import 'package:coke_platform/service/firebase/auth.dart';
import 'package:coke_platform/service/firebase/role.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> with Validator {
  final service = AppDependencies.injector.get<FirebaseAuthService>();
  final form = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final isMobile = 1400.w < 500;
    return Title(
      color: Theme.of(context).colorScheme.primary,
      title: 'Login',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Stack(
              children: [
                Assets.images.header.image(
                  width: 1400.w,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  right: 40.w,
                  top: 10.w,
                  child: const LanguageSwitch(),
                ),
                Positioned(
                  top: isMobile ? 10 : 10.w,
                  left: (1400.w - (isMobile ? 60 : 240)) / 2,
                  child: InkWell(
                    onTap: () {
                      context.go('/');
                    },
                    child: Assets.images.logoWhite.image(
                      width: isMobile ? 60 : 240,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 1400.w < 500 ? 1000.w : 600.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 1,
                          blurRadius: 8,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(1400.w < 500 ? 6 : 16),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 1400.w < 500 ? 16 : 24.w,
                      vertical: 1400.w < 500 ? 16 : 24.h,
                    ),
                    child: Form(
                      key: form,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldWidget(
                            label: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            validator: checkRequired,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          24.hMax.hSpace,
                          TextFieldWidget(
                            label: S.current.password,
                            fillColor: Colors.white,
                            filled: true,
                            obscureText: true,
                            validator: checkRequired,
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          SizedBox(height: 40.hMax),
                          CustomFilledButton(
                            color: ColorConstants.teal,
                            title: S.current.login,
                            onTap: () async {
                              if (form.currentState!.validate()) {
                                try {
                                  LoadingUtility.show();
                                  final auth = service;
                                  await auth.signInWithEmailAndPassword(email, password);
                                  final roleService = AppDependencies.injector.get<FirebaseRoleService>();
                                  final role = await roleService.getUserRole(auth.getUserId()!);
                                  if (role == 'Admin') {
                                    context.go('/admin');
                                  } else {
                                    context.go('/contestant');
                                  }
                                } catch (e) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        'Error',
                                        style: TextStyle(fontSize: 26.sp, color: Colors.red),
                                      ),
                                      content: Text(
                                        e.toString(),
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  );
                                } finally {
                                  LoadingUtility.dismiss();
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
