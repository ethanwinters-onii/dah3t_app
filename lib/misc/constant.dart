import 'package:flutter/material.dart';

class AppConstants {
  static const String rootAssets = 'assets/';

  // Colors
  static const Color backgroundColor = Color(0xFFF77D8E);
  static const Color iconColor = Color(0xFFFE0037);
  static const Color backgroundColor2 = Color(0xFF17203A);
  static const Color backgroundColorLight = Color(0xFFF2F6FF);
  static const Color backgroundColorDark = Color(0xFF25254B);
  static const Color shadowColorLight = Color(0xFF4A5367);
  static const Color shadowColorDark = Colors.black;
  static const Color textColor = Color(0xFF5d69b3);

  // Fonts
  static const String lexend = 'Lexend';
  static const String intel = 'Intel';
  static const String poppins = 'Poppins';

  // Font style

  // Rive Animation
  static const String riveFolder = 'RiveAssets/';
  static const String button = rootAssets + riveFolder + 'button.riv';
  static const String check = rootAssets + riveFolder + 'check.riv';
  static const String confetti = rootAssets + riveFolder + 'confetti.riv';
  static const String house = rootAssets + riveFolder + 'house.riv';
  static const String icons = rootAssets + riveFolder + 'icons.riv';
  static const String menuButton = rootAssets + riveFolder + 'menu_button.riv';
  static const String discovery = rootAssets + riveFolder + 'discovery.riv';

  // Image
  static const String backgroundImage = rootAssets + 'Backgrounds/Spline.png';

  // Icons
  static const String iconFolder = 'icons/';
  static const String emailIcon = rootAssets + iconFolder + 'email.svg';
  static const String passwordIcon = rootAssets + iconFolder + 'password.svg';
  static const String emailBox = rootAssets + iconFolder + 'email_box.svg';
  static const String googleBox = rootAssets + iconFolder + 'google_box.svg';
  static const String appleBox = rootAssets + iconFolder + 'apple_box.svg';
}

class AppStyle {
  static const st1 = TextStyle(color: Colors.grey, fontWeight: FontWeight.bold);
}

class AppImages {
  static const String imagePath = "assets/images";
  static const String userImage = "$imagePath/person.png";
  static const String openaiLogo = "$imagePath/openai_logo.jpg";
  static const String botImage = "$imagePath/chat_logo.png";
}

// List<String> models = [
//   'Model1',
//   'Model2',
//   'Model3',
//   'Model4',
//   'Model5',
//   'Model6',
// ];

// final chatMessages = [
//       {
//         "msg": "Hello who are you?",
//         "chatIndex": 0,
//       },
//       {
//         "msg":
//             "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
//         "chatIndex": 1,
//       },
//       {
//         "msg": "What is flutter?",
//         "chatIndex": 0,
//       },
//       {
//         "msg":
//             "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web. Flutter uses the Dart programming language and allows for the creation of high-performance, visually attractive, and responsive apps. It also has a growing and supportive community, and offers many customizable widgets for building beautiful and responsive user interfaces.",
//         "chatIndex": 1,
//       },
//       {
//         "msg": "Okay thanks",
//         "chatIndex": 0,
//       },
//       {
//         "msg":
//             "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
//         "chatIndex": 1,
//       },
//     ];