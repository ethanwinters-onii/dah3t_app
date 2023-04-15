import 'package:discovery_app/utils/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../misc/constant.dart';

Future<Object?> customSignUpDialog(BuildContext context) {
  return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Register",
      barrierColor: Colors.white,
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        Tween<Offset> tween;
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        return SlideTransition(
          position: tween.animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
          child: child,
        );
      },
      pageBuilder: (context, _, __) => Center(
            child: Container(
                height: 1.sh,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.94),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                ),
                child: Scaffold(
                    backgroundColor: Colors.white,
                    resizeToAvoidBottomInset: false,
                    body: Column(
                      children: [
                        const Text(
                          "Create an account.",
                          style: TextStyle(
                              fontFamily: AppConstants.poppins, fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already a member?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Sign In'))
                            ],
                          ),
                        ),
                        const SignUpForm(),
                      ],
                    ))),
          ));
}