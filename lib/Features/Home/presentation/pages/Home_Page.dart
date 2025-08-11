import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam/Core/Resources/AssetManager.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';
import 'package:online_exam/Features/Home/presentation/widgets/HomeTab.dart';
import 'package:online_exam/Features/Home/presentation/widgets/ProfileTab.dart';
import 'package:online_exam/Features/Home/presentation/widgets/ResultsTab.dart';

import '../../../Auth/Profile/presentation/pages/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = [
    HomeTab(),
    const ResultsTab(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 2,
        indicatorColor: Colors.transparent,
        // no background indicator
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: [
          _buildNavDestination(
            iconPath: AssetsManager.homeTab,
            label: StringsManager.homeTab,
            isSelected: selectedIndex == 0,
          ),
          _buildNavDestination(
            iconPath: AssetsManager.resultsTab,
            label: StringsManager.result,
            isSelected: selectedIndex == 1,
          ),
          _buildNavDestination(
            iconPath: AssetsManager.profileTab,
            label: StringsManager.profileTab,
            isSelected: selectedIndex == 2,
          ),
        ],
      ),
    );
  }

  NavigationDestination _buildNavDestination({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.blueAccent : Colors.grey,
          BlendMode.srcIn,
        ),
        width: 26,
        height: 26,
      ),
      label: label,
    );
  }
}
