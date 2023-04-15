import 'package:rive/rive.dart';

import '../misc/constant.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
      {required this.src,
      required this.artboard,
      required this.stateMachineName,
      required this.title});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
      src: AppConstants.icons,
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
      title: "Home"),
  RiveAsset(
      src: AppConstants.icons,
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  // RiveAsset(
  //     src: AppConstants.icons,
  //     artboard: "TIMER",
  //     stateMachineName: "TIMER_Interactivity",
  //     title: "Timer"),
  RiveAsset(
      src: AppConstants.icons,
      artboard: "CHAT",
      stateMachineName: "CHAT_Interactivity",
      title: "Chat"),
  RiveAsset(
      src: AppConstants.icons,
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
      title: "Profile"),
];

List<RiveAsset> sideMenus = [
  RiveAsset(
      src: AppConstants.icons,
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
      title: "Home"),
  RiveAsset(
      src: AppConstants.icons,
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset(
      src: AppConstants.icons,
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
      title: "Favorites"),
  RiveAsset(
    src: AppConstants.icons,
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat Bot"),
];

List<RiveAsset> sideMenu2 = [
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAsset(
    src: "assets/RiveAssets/icons.riv",
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notification",
  ),
];
