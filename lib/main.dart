import 'package:coffee/core/presentation/screen/init_screens/Get_started.dart';
import 'package:coffee/core/presentation/screen/mainScreens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final  isFirstTime = prefs.getBool('isFirstTime') ?? true;

  runApp( MainApp(isFirstTime: isFirstTime));
}

class MainApp extends StatelessWidget {
  final bool isFirstTime;
  const MainApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isFirstTime ? const GetStarted() : const Homepage());
  }
}
