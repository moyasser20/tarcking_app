import 'package:flutter/material.dart';
import 'core/config/di.dart';
import 'features/auth/presentation/apply/view/apply_screen.dart';

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
