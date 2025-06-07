import 'package:flutter/material.dart';

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NutritionPage"),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text('Hello World!')),
    );
  }
}
