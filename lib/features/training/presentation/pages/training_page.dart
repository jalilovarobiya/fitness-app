import 'package:flutter/material.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TrainingPage"),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text('Hello World!')),
    );
  }
}
