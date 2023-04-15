import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../models/rive_asset.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
    required this.menu,
    required this.onPress,
    required this.onInit,
    required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback onPress;
  final ValueChanged<Artboard> onInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0).r,
          child: Divider(
            height: 1,
            color: Colors.white24,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              left: 0,
              width: isActive ? 288 : 0,
              height: 56,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff6792ff),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              )),
            ListTile(
              onTap: onPress,
              leading: SizedBox(
                width: 34.r,
                height: 34.r,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: onInit,
                ),
              ),
              title: Text(
                menu.title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
