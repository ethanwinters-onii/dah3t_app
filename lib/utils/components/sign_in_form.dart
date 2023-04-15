import 'package:discovery_app/nav_page.dart';
import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../../misc/constant.dart';
import '../rive/rive_utils.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  bool isShowLoading = false;
  bool isShowConfetti = true;

  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    username = TextEditingController(text: "");
    password = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    username.dispose();
    password.dispose();
    super.dispose();
  }

  void signIn(BuildContext context) async {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    bool isLogin = await ApiService.login(
        username: username.text, password: password.text);
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_formKey.currentState!.validate() && isLogin) {
        check.fire();
        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            isShowLoading = false;
          });
          confetti.fire();
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => EntryPoint(pageIndex: 0,)),
                (route) => false);
            // Get.to(() => EntryPoint(), transition: Transition.fade, duration: const Duration(milliseconds: 500));
          });
        });
      } else {
        error.fire();
        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            isShowLoading = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  // autofocus: true,
                  controller: username,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(AppConstants.emailIcon),
                  )),
                ),
              ),
              Text('Password'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  obscureText: true,
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SvgPicture.asset(AppConstants.passwordIcon),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 16),
                child: ElevatedButton.icon(
                    onPressed: () {
                      signIn(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.backgroundColor,
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ))),
                    icon: Icon(
                      CupertinoIcons.arrow_right,
                      color: AppConstants.iconColor,
                    ),
                    label: Text('Sign In')),
              )
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                AppConstants.check,
                onInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard);
                  check = controller.findSMI("Check") as SMITrigger;
                  error = controller.findSMI("Error") as SMITrigger;
                  reset = controller.findSMI("Reset") as SMITrigger;
                },
              ))
            : SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 6,
                  child: RiveAnimation.asset(
                    AppConstants.confetti,
                    onInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard);

                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger;
                    },
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  final Widget child;
  final double size;

  const CustomPositioned({super.key, required this.child, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          Spacer(),
          SizedBox(
            width: size.r,
            height: size.r,
            child: child,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
