import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../misc/constant.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({super.key, required this.event, required this.controller});
  final VoidCallback event;
  final RiveAnimationController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: event,
      child: SizedBox(
        width: 260.w,
        height: 64.h,
        child: Stack(
          children: [
            RiveAnimation.asset(
              AppConstants.button,
              controllers: [controller],
            ),
            Positioned(
                child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 4).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'Let\'s get started',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
