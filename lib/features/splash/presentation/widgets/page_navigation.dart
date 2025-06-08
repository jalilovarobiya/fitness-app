import 'package:flutter/material.dart';

class PageNavigation extends StatelessWidget {
  final int currentIndex;
  final int totalPage;
  const PageNavigation({
    super.key,
    required this.currentIndex,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPage,
        (index) => Icon(
          index == currentIndex
              ? Icons.radio_button_checked
              : Icons.radio_button_unchecked,
          color: Colors.pink[400],
          size: 20,
        ),
      ),
    );
  }
}
