import 'package:flutter/material.dart';
import 'package:gym_swat/core/theme/app_colors.dart';
import 'package:gym_swat/features/bottom_nav/widgets/build_pages.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white.withValues(alpha: 0.95),
        unselectedItemColor: const Color.fromRGBO(168, 175, 179, 1),
        selectedItemColor: AppColors.primaryColor,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: bottomTabs,
      ),
      body: buildPage(index: currentIndex),
    );
  }
}
