import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../src/locale.dart';
//import '../page/guest.dart';
import '../page/landing.dart';
//import '../page/login.dart';
//import '../page/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raffle App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        //'/guest': (context) => const GuestPage(),
        //'/login': (context) => const LoginPage(),
        //'/register': (context) => const RegisterPage(),
      },
    );
  }
}
