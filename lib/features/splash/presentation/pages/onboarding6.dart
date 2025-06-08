import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/features/navigation/pages/main_wrapper_page.dart';
import 'package:fitness_app/features/splash/presentation/pages/onboarding7.dart';
import 'package:fitness_app/features/splash/presentation/widgets/page_navigation.dart';
import 'package:flutter/material.dart';

class Onboarding6 extends StatelessWidget {
  final int currenIndex;
  final int totalPage;
  const Onboarding6({super.key, this.currenIndex = 4, this.totalPage = 8});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 223, 223),
      body: GestureDetector(
        onTap: () {
          if (currenIndex < totalPage - 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (contex) => Onboarding7(
                      currenIndex: currenIndex + 1,
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
                    image: AssetImage(AppImages.onboarding5),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              right: 55,
              child: Image.asset(AppImages.smallSquare),
            ),
            Positioned(
              top: 300,
              right: 55,
              child: Image.asset(AppImages.arrow),
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
                        "Here you can find additional bonuses such as yoga, pilates and relax workouts. ",
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
                            currentIndex: currenIndex,
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
