import 'package:citygrow/app/screens/home/home_screen.dart';
import 'package:citygrow/app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:citygrow/app/screens/auth/login_screen.dart';
import 'package:citygrow/app/screens/auth/register_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/splash': (context) =>  SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/home': (context) => HomePage(), 
};
