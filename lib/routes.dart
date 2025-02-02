import 'package:citygrow/app/screens/home/home_screen.dart';
import 'package:citygrow/app/screens/main_screen.dart';
import 'package:citygrow/app/screens/profile_details.dart';
import 'package:citygrow/app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:citygrow/app/screens/auth/login_screen.dart';
import 'package:citygrow/app/screens/auth/register_screen.dart';
import 'package:citygrow/app/screens/auth/forget_password_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/splash': (context) =>  SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/home': (context) => HomePage(), 
  '/main': (context) => MainScreen(),
  '/profile': (context) =>ProfileSetupScreen(),
  '/forgot-password' : (context) => ForgotPasswordScreen()
};
