import 'package:discovery_app/pages/detail_page.dart';
import 'package:discovery_app/pages/home_page.dart';
import 'package:discovery_app/providers/openai_model_provider.dart';
import 'package:discovery_app/route/router_name.dart';
import 'package:discovery_app/route/routers.dart';
import 'package:discovery_app/service/logger_service.dart';
import 'package:discovery_app/utils/commons/modules/resful_module_impl.dart';
import 'package:discovery_app/utils/commons/storage/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'nav_page.dart';
import 'onboarding_screen.dart';
import 'utils/commons/modules/restful_module.dart';

void main() {
  initRootLogger();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => OpenAIModelProvider()),
          ],
          child: GetMaterialApp(
            title: 'Discovery App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0xFFEEF1F8),
              primarySwatch: Colors.blue,
              fontFamily: "Intel",
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(height: 0),
                border: defaultInputBorder,
                enabledBorder: defaultInputBorder,
                focusedBorder: defaultInputBorder,
                errorBorder: defaultInputBorder,
              ),
            ),
            initialRoute: RouteName.onBoarding,
            onGenerateRoute: AppRouters.onGenerateRoute,
            home: const OnboardingScreen(),
            initialBinding: InitialBindings(),          
          ),
        );
      },
      child: const OnboardingScreen(),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);

class InitialBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<RestfulModule>(RestfulModuleImpl());
    Get.put<GetConnect>(GetConnect());
    Get.put<LocalStorageService>(LocalStorageService());
  }
}
