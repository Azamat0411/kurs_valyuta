import 'package:flutter/material.dart';
import 'package:kurs_valyuta/const.dart';
import 'package:kurs_valyuta/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'connectivity_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: darkThemeData(context),
        theme: themeData(context),
        home: const SplashScreen(),
      ),
    );
  }
}
