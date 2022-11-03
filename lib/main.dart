import 'package:flutter/material.dart';
import 'package:pqms_flutter/ui/routes/app_pages.dart';
import 'package:pqms_flutter/ui/routes/app_routes.dart';
import 'package:pqms_flutter/ui/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.intial,
      routes: AppPages.routes
      
    );
  }
}
