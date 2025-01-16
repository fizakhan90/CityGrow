import 'package:flutter/material.dart';
import 'package:citygrow/app/screens/auth/login_screen.dart';
import 'package:citygrow/app/screens/auth/register_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/home': (context) => Scaffold(body: Center(child: Text('Home Screen'))), 
};
