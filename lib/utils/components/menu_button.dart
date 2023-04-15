import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../misc/constant.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.press,
    required this.riveOnInit,
  });

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 16.w),
          width: 40.r,
          height: 40.r,
          decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, offset: Offset(0, 3), blurRadius: 8)
              ]),
          child: RiveAnimation.asset(
            AppConstants.menuButton,
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}