import 'package:flutter/material.dart';
import 'core/config/di.dart';
import 'package:tarcking_app/features/auth/presentation/view/apply_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tracking App',
      home: const ApplyScreen(),
    );
  }
}