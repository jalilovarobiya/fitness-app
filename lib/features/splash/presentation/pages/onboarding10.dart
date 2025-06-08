import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/features/navigation/pages/main_wrapper_page.dart';
import 'package:fitness_app/features/splash/presentation/widgets/page_navigation.dart';
import 'package:flutter/material.dart';

class Onboarding10 extends StatelessWidget {
  final int currenIndex;
  final int totalPage;
  const Onboarding10({super.key, this.currenIndex = 8, this.totalPage = 8});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 223, 223),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (contex) => MainScreen()),
          );
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.onboarding9),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 180,
              right: 55,
              child: Image.asset(AppImages.circle),
            ),
            Positioned(
              bottom: 130,
              right: 170,
              child: Image.asset(AppImages.leftArrrow),
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
                        "If you lack motivation, take a look at our blog. Here you can find a lot of important information about healthy lifestyle.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Row(
                        children: [
                          PageNavigation(
                            currentIndex: currenIndex,
                            totalPage: totalPage,
                          ),
                          Spacer(),
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
