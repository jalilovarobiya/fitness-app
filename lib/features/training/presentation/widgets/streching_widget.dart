import 'dart:ui';

import 'package:fitness_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StrechingWidget extends StatelessWidget {
  final String image;
  final bool isUnlocked;
  final String text;
  final void Function()? onTap;
  const StrechingWidget({
    super.key,
    required this.image,
    this.isUnlocked = false,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 250,
          child: Stack(
            children: [
              Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),
              if (isUnlocked)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              if (isUnlocked)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      SvgPicture.asset(AppImages.lock, width: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400],
                        ),
                        onPressed: () {},
                        child: Text(
                          "UNLOCK",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
