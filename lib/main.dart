import 'package:flutter/material.dart';
import 'package:tarcking_app/features/apply/presentation/view/apply_screen.dart';
import 'core/config/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
