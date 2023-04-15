import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:discovery_app/misc/constant.dart';
import 'package:discovery_app/pages/chat_page.dart';
import 'package:discovery_app/pages/home_page.dart';
import 'package:discovery_app/pages/profile_page.dart';
import 'package:discovery_app/pages/recent_page.dart';
import 'package:discovery_app/pages/search_page.dart';
import 'package:discovery_app/service/logger_service.dart';
import 'package:discovery_app/utils/components/animated_bar.dart';
import 'package:discovery_app/utils/components/menu_button.dart';
import 'package:discovery_app/utils/components/side_menu.dart';
import 'package:discovery_app/utils/rive/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/rive_asset.dart';
import 'package:path/path.dart';


class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key, required this.pageIndex});
  final int pageIndex;

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  // late SMIBool searchTrigger;

  RiveAsset selectedBottomNav = bottomNavs.first;
  late SMIBool isSideBarClosed;

  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  late int selectedPage;
  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    // RecentPage(),
    ChatPage(),
    ProfilePage()
  ];

  Future<void> _savingModelFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    // final String modelDirectory = join(directory.path, 'mobilenetv2_v3.ptl');
    final String modelDirectory = join(directory.path, 'mobilenetv2.ptl');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("modelpath", modelDirectory);
    logger.info(modelDirectory);

    if (!File(modelDirectory).existsSync()) {
      final ByteData data =
          await rootBundle.load('assets/model/mobilenetv2.ptl');
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(modelDirectory).writeAsBytes(bytes);
    }
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });

    _savingModelFile().then((void value) => logger
        .info('Model -- MobilenetV2_RegnetX -- Has Been Created Successfully'));

    selectedPage = widget.pageIndex;

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: AppConstants.backgroundColor2,
      body: Stack(
        children: [
          AnimatedPositioned(
              width: 288.w,
              height: 1.sh,
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              left: isSideMenuClosed ? -288 : 0,
              child: SideMenu()),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              // rotate 30
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 265, 0),
                child: Transform.scale(
                    scale: scalAnimation.value,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        child: pages[selectedPage]))),
          ),
          if (selectedPage == 0 || selectedPage == 1)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              top: 16.h,
              left: isSideMenuClosed ? 0 : 222.w,
              child: MenuButton(
                riveOnInit: (Artboard value) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(value,
                          stateMachineName: 'State Machine');

                  isSideBarClosed = controller.findSMI('isOpen') as SMIBool;
                  isSideBarClosed.value = true;
                },
                press: () {
                  isSideBarClosed.value = !isSideBarClosed.value;
                  if (isSideMenuClosed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(() {
                    isSideMenuClosed = isSideBarClosed.value;
                  });
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100.h * animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
                color: AppConstants.backgroundColor2.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    bottomNavs.length,
                    (index) => GestureDetector(
                          onTap: () {
                            if (selectedBottomNav != bottomNavs[index]) {
                              setState(() {
                                selectedBottomNav = bottomNavs[index];
                                selectedPage = index;
                              });
                            }
                            bottomNavs[index].input!.change(true);
                            Future.delayed(const Duration(milliseconds: 800),
                                () {
                              bottomNavs[index].input!.change(false);
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedBar(
                                  isActive:
                                      selectedPage == index),
                              Opacity(
                                opacity: bottomNavs[index] == selectedBottomNav
                                    ? 1
                                    : 0.5,
                                child: SizedBox(
                                  width: 36,
                                  height: 36,
                                  child: RiveAnimation.asset(
                                    bottomNavs[index].src,
                                    artboard: bottomNavs[index].artboard,
                                    onInit: (artboard) {
                                      StateMachineController controller =
                                          RiveUtils.getRiveController(artboard,
                                              stateMachineName:
                                                  bottomNavs[index]
                                                      .stateMachineName);
                                      bottomNavs[index].input = controller
                                          .findSMI("active") as SMIBool;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
