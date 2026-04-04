import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry_app/app_router.dart';
import 'package:hungry_app/core/constant/strings.dart';
import 'package:hungry_app/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hungry App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
      ),
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: splashRouter,
    );
  }
}
