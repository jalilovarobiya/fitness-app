import 'package:fitness_app/features/blog/presentation/pages/blog_page.dart';
import 'package:fitness_app/features/courses/presentation/pages/course_page.dart';
import 'package:fitness_app/features/home/presentation/pages/home_page.dart';
import 'package:fitness_app/features/nutrition/presentation/pages/nutrition_page.dart';
import 'package:fitness_app/features/profile/presentation/pages/profile_page.dart';
import 'package:fitness_app/features/training/presentation/pages/training_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainWrapperPage extends StatefulWidget {
  const MainWrapperPage({super.key});

  @override
  State<MainWrapperPage> createState() => _MainWrapperPageState();
}

class _MainWrapperPageState extends State<MainWrapperPage> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return IndexedStack(
            index: value,
            children: [
              HomePage(),
              TrainingPage(),
              CoursePage(),
              BlogPage(),
              NutritionPage(),
              ProfilePage(),
            ],
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, _) {
          return BottomNavigationBar(
            currentIndex: value,
            onTap: (index) {
              currentIndex.value = index;
            },
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: "training",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill),
                label: "cources",
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.instagram),
                label: "blog",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apple),
                label: "nutrition",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.comment_rounded),
                label: "profile",
              ),
            ],
          );
        },
      ),
    );
  }
}
