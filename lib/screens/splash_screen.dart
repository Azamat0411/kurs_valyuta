import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kurs_valyuta/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20,),
            Text("Valyuta kursi", style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color, fontSize: 20))
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    openNextPage(context);
  }

  openNextPage(BuildContext context) async {
    Timer(const Duration(seconds: 2), () async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomePage()));
    });
  }
}
