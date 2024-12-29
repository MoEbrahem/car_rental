import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rental_car/injection.dart';
import 'package:rental_car/presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCa4CxUYr4ElCAydqO6q9E36HY_3CMRCrA",
    appId: "com.example.rental_car",
    messagingSenderId: "324745934669",
    projectId: "rental-car-15c7a",
  ),
  );
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rental Car',
      home: OnBoardingPage()
    );
  }
}
