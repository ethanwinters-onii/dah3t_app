import 'package:discovery_app/nav_page.dart';
import 'package:discovery_app/onboarding_screen.dart';
import 'package:discovery_app/pages/detail_page.dart';
import 'package:discovery_app/pages/home_page.dart';
import 'package:discovery_app/route/router_name.dart';
import 'package:flutter/material.dart';

class AppRouters {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.onBoarding:
        {
          return MaterialPageRoute(builder: (_) => OnboardingScreen());
        }
      case RouteName.homePage:
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case RouteName.entryPoint:
        {
          int pageIndex = settings.arguments as int;
          return MaterialPageRoute(builder: (_) => EntryPoint(pageIndex: pageIndex,));
        }
      case RouteName.detailPage:
        {
          List<dynamic> args = settings.arguments as List<dynamic>;
          return MaterialPageRoute(
              builder: (_) => DetailPage(tag: args[0], e: args[1]));
        }
      default:
        {
          return MaterialPageRoute(builder: (context) {
            return Scaffold(
                body: Center(
              child: Text("No routes match"),
            ));
          });
        }
    }
  }
}
