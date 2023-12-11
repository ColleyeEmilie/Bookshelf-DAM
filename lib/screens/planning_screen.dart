import 'package:flutter/material.dart';

import '../widgets/navigation/bottom_navigation.dart';

class PlanningScreen extends StatelessWidget {
  const PlanningScreen({super.key});
  static const String routeName = '/planning';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Planning"),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
