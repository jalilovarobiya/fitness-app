import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_app/features/blog/presentation/pages/blog_page.dart';
import 'package:fitness_app/features/courses/presentation/pages/course_page.dart';
import 'package:fitness_app/features/home/presentation/pages/home_page.dart';
import 'package:fitness_app/features/nutrition/presentation/pages/nutrition_page.dart';
import 'package:fitness_app/features/profile/presentation/pages/profile_page.dart';
import 'package:fitness_app/features/training/presentation/pages/training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/di/service_locator.dart' as di;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late String userId;
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    _authBloc = di.sl<AuthBloc>();
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      HomePage(),
      TrainingPage(),
      CoursePage(),
      BlogPage(),
      NutritionPage(),
      ProfilePage(userId: userId),
    ];
    return BlocProvider.value(
      value: _authBloc,
      child: Scaffold(
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,

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
        ),
      ),
    );
  }
}
