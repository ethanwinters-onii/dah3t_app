import 'dart:ui';

import 'package:discovery_app/misc/constant.dart';
import 'package:discovery_app/utils/components/animated_button.dart';
import 'package:discovery_app/utils/components/custom_signin_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isShowingSignInDialog = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.backgroundColor2,
        body: Stack(
          children: [
            // Positioned(
            //     width: 1.7.sw,
            //     bottom: 200.h,
            //     left: 100.w,
            //     child: Image.asset(AppConstants.backgroundImage)),
            // Positioned.fill(
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            //     // child: SizedBox(),
            //   ),
            // ),
            const RiveAnimation.asset(AppConstants.discovery),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: const SizedBox(),
              ),
            ),
            AnimatedPositioned(
              width: 1.sw,
              height: 1.sh,
              duration: const Duration(milliseconds: 250),
              top: isShowingSignInDialog ? -50 : 0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 1),
                      SizedBox(
                        width: 350.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "It's the big world",
                              style: TextStyle(
                                fontSize: 36,
                                fontFamily: AppConstants.poppins,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              "Out There, Go Explore",
                              style: TextStyle(
                                  fontSize: 52,
                                  fontFamily: AppConstants.poppins,
                                  height: 1.2,
                                  color: Colors.white),
                            ),
                            Text(
                              "The real voyage of discovery consists not in seeking new landscapes, but in having new eyes.",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const Spacer(flex: 3),
                      AnimatedButton(
                          event: () {
                            _btnAnimationController.isActive = true;
                            Future.delayed(const Duration(milliseconds: 800),
                                () {
                              setState(() {
                                isShowingSignInDialog = true;
                              });
                              customSignInDialog(context, onClosed: (_) {
                                setState(() {
                                  isShowingSignInDialog = false;
                                });
                              });
                            });
                          },
                          controller: _btnAnimationController),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.0),
                        child: Text(
                          "\"Love, like everything else in life, should be a discovery, an adventure, and like most adventures, you don’t know you’re having one until you’re right in the middle of it.\"",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
