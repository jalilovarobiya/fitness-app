import 'package:flutter/material.dart';
import 'package:fitness_app/core/utils/main_utils.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: Colors.pink[400],
            labelColor: Colors.pink[400],
            tabs: [
              Tab(text: "Stretching"),
              Tab(text: "Functional"),
              Tab(text: "Body Mind"),
            ],
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(AppImages.paymentWhiteMode),
            ),
          ],
          centerTitle: true,
          title: Text("TrainingPage"),
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [StretchingBody(), FunctionalBody(), BodyMind()],
        ),
      ),
    );
  }
}
