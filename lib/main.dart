import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view/splash/splash_screen.dart';
import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';


void main() {
  
  runApp(DevicePreview(
      enabled: true,
      
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      
      home: const SplashScreen(),
    );
  }
}
