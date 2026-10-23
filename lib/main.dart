import 'package:contact_app/ui/addContactScreen.dart';
import 'package:contact_app/ui/splash_screen.dart';
import 'package:contact_app/utiles/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.homeScreen ,
      routes: {
        AppRoutes.homeScreen:(context) => HomeScreen(),
        AppRoutes.addContactScreen:(context) => AddContactScreen(),
      },
    );
  }
}