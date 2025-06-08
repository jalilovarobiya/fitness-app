import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/features/navigation/pages/main_wrapper_page.dart';
import 'package:fitness_app/features/splash/presentation/pages/onboarding3.dart';
import 'package:fitness_app/features/splash/presentation/widgets/page_navigation.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  final int currentIndex;
  final int totalPage;

  const Onboarding2({super.key, this.currentIndex = 0, this.totalPage = 8});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 223, 223),
      body: GestureDetector(
        onTap: () {
          if (currentIndex < totalPage - 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (contex) => Onboarding3(
                      currenIndex: currentIndex + 1,
                      totalPage: totalPage,
                    ),
              ),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (contex) => MainScreen()),
            );
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.onboarding2),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230,
              left: 40,
              child: Image.asset(AppImages.square),
            ),
            Positioned(
              top: 480,
              right: 50,
              child: Image.asset(AppImages.arrow2),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    spacing: 20,
                    children: [
                      Text(
                        "You are on your home page. Here you can read new articles and see new courses.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PageNavigation(
                            currentIndex: currentIndex,
                            totalPage: totalPage,
                          ),
                          // Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (contex) => MainScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Skip",
                              // style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
