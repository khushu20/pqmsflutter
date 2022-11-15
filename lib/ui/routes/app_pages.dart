import 'package:flutter/cupertino.dart';
import 'package:pqms_flutter/ui/generate_mpin.dart';
import 'package:pqms_flutter/ui/login_screen.dart';
import 'package:pqms_flutter/ui/routes/app_routes.dart';
import 'package:pqms_flutter/ui/splash_screen.dart';
import 'package:pqms_flutter/ui_user/home_page.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.getstart: ((context) => SplashScreen()),
      AppRoutes.login: ((context) => LoginScreen()),
      AppRoutes.generateMpin: ((context) => GenerateMpin()),
        AppRoutes.home: ((context) => MyHomePage()),
      
    };
  }
}
