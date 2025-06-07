import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/features/app/presentation/pages/app_page.dart';
import 'package:flutter/material.dart';
import 'core/di/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.setUpServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage();
  }
}
