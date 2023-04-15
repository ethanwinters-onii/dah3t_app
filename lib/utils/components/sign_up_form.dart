import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../misc/constant.dart';
import '../../nav_page.dart';
import '../rive/rive_utils.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  bool isShowLoading = false;
  bool isShowConfetti = true;

  late TextEditingController nameController;
  late TextEditingController occController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController userController;
  late TextEditingController passController;

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    occController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    userController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    occController.dispose();
    emailController.dispose();
    phoneController.dispose();
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  void signUp(BuildContext context) async {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    // bool isLogin = await ApiService.login(
    //     username: username.text, password: password.text);
    bool registerStatus = await ApiService.register(
        name: nameController.text,
        job: occController.text,
        phoneNumber: phoneController.text,
        email: emailController.text,
        username: userController.text,
        password: passController.text);
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (_formKey.currentState!.validate() && registerStatus) {
        check.fire();
        await ApiService.login(
            username: userController.text, password: passController.text);
        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            isShowLoading = false;
          });
          confetti.fire();
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (_) => EntryPoint(
                          pageIndex: 0,
                        )),
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Your name',
                          style: AppStyle.st1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 16, right: 8),
                          child: TextFormField(
                            // autofocus: true,
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            onSaved: (name) {},
                            decoration: InputDecoration(
                                hintText: 'Name *',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppConstants.backgroundColor2),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Occupation',
                            style: AppStyle.st1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 16, left: 8),
                          child: TextFormField(
                            controller: occController,
                            // autofocus: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "";
                              }
                              return null;
                            },
                            onSaved: (occ) {},
                            decoration: InputDecoration(
                                hintText: "Occupation *",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppConstants.backgroundColor2),
                                  borderRadius: BorderRadius.circular(25.0),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                'Email',
                style: AppStyle.st1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  // autofocus: true,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                      hintText: "your-email@gmail.com",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppConstants.backgroundColor2),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
              ),
              Text(
                'Phone number',
                style: AppStyle.st1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  // autofocus: true,
                  controller: phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (phone) {},
                  decoration: InputDecoration(
                      hintText: "0xxxxx",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppConstants.backgroundColor2),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
              ),
              Text(
                'Username',
                style: AppStyle.st1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  // autofocus: true,
                  controller: userController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (user) {},
                  decoration: InputDecoration(
                      hintText: "username",
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppConstants.backgroundColor2),
                        borderRadius: BorderRadius.circular(25.0),
                      )),
                ),
              ),
              Text(
                'Password',
                style: AppStyle.st1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                child: TextFormField(
                  obscureText: true,
                  controller: passController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  decoration: InputDecoration(
                    hintText: "******",
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: AppConstants.backgroundColor2),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 16),
                child: ElevatedButton.icon(
                    onPressed: () {
                      signUp(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.backgroundColor,
                        minimumSize: const Size(double.infinity, 56),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ))),
                    icon: const Icon(
                      CupertinoIcons.arrow_right,
                      color: AppConstants.iconColor,
                    ),
                    label: Text('Sign Up')),
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
          Spacer(
            flex: 1,
          ),
          SizedBox(
            width: size.r,
            height: size.r,
            child: child,
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
