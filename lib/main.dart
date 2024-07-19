import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/auth/Presentation/provider/data_class_candidate.dart';
import 'package:evoting_final/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:evoting_final/features/splash_view/splashview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataClassVoter()),
        ChangeNotifierProvider(create: (context) => DataClassCandidate()),
        ChangeNotifierProvider(create: (context) => InternetConnectionProvider()),
        ],
        child: MyApp(),
        ),
        );
  }
  class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
      '/': (context) => SplashView(),
      }
    );
  }
}
