import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BlogPage"), automaticallyImplyLeading: false),
      body: Center(child: Text('Hello World!')),
    );
  }
}
