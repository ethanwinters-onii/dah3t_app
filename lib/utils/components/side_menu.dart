import 'package:discovery_app/nav_page.dart';
import 'package:discovery_app/pages/chat_page.dart';
import 'package:discovery_app/pages/home_page.dart';
import 'package:discovery_app/pages/profile_page.dart';
import 'package:discovery_app/pages/search_page.dart';
import 'package:discovery_app/utils/commons/storage/local_storage_service.dart';
import 'package:discovery_app/utils/components/info_card.dart';
import 'package:discovery_app/utils/components/side_menu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

import '../../models/rive_asset.dart';
import '../rive/rive_utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset? _selectedMenu;

  Map<String, int> navs = {
    "Home": 0,
    "Search": 1,
    "Favorites": 3,
    "Chat Bot": 2
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288.w,
        height: 1.sh,
        color: const Color(0xff17203a),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                name: LocalStorageService().userName ?? "User",
                profession: LocalStorageService().userJob ?? "Developer",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
                child: Text(
                  'BROWSER',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus
                  .map((e) => SideMenuTile(
                        menu: e,
                        onInit: (artboard) {
                          // print(e.artboard);
                          StateMachineController controller =
                              RiveUtils.getRiveController(artboard,
                                  stateMachineName: e.stateMachineName);
                          e.input = controller.findSMI("active") as SMIBool;
                        },
                        onPress: () {
                          e.input!.change(true);
                          Future.delayed(const Duration(seconds: 1), () {
                            e.input!.change(false);
                          });
                          setState(() {
                            _selectedMenu = e;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      EntryPoint(pageIndex: navs[e.title]!)));
                        },
                        isActive: _selectedMenu == e,
                      ))
                  .toList(),
              // Padding(
              //   padding: const EdgeInsets.only(left: 24.0, top: 32, bottom: 16),
              //   child: Text(
              //     'HISTORY',
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleMedium!
              //         .copyWith(color: Colors.white70),
              //   ),
              // ),
              // ...sideMenu2
              //     .map((e) => SideMenuTile(
              //           menu: e,
              //           onInit: (artboard) {
              //             // print(e.artboard);
              //             StateMachineController controller =
              //                 RiveUtils.getRiveController(artboard,
              //                     stateMachineName: e.stateMachineName);
              //             e.input = controller.findSMI("active") as SMIBool;
              //           },
              //           onPress: () {
              //             e.input!.change(true);
              //             Future.delayed(const Duration(seconds: 1), () {
              //               e.input!.change(false);
              //             });
              //             setState(() {
              //               _selectedMenu = e;
              //             });
              //           },
              //           isActive: _selectedMenu == e,
              //         ))
              //     .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
