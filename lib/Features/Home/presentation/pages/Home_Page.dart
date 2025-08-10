import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam/Core/Resources/AssetManager.dart';
import 'package:online_exam/Core/Resources/stringsManager.dart';
import 'package:online_exam/Features/Home/presentation/widgets/HomeTab.dart';
import 'package:online_exam/Features/Home/presentation/widgets/ProfileTab.dart';
import 'package:online_exam/Features/Home/presentation/widgets/ResultsTab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  //List<Subjects>subjects=[];
  List<Widget> tabs = [HomeTab(), ResultsTab(), ProfileTab()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Colors.white70,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.hometab,
                colorFilter:
                    ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
              ),
              label: StringsManager.homeTab,
              selectedIcon: SvgPicture.asset(
                AssetsManager.hometab,
                colorFilter:
                    ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.resultstab,
                colorFilter:
                    ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
              ),
              label: StringsManager.result,
              selectedIcon: SvgPicture.asset(
                AssetsManager.resultstab,
                colorFilter:
                    ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
              ),
            ),
            NavigationDestination(
              icon: SvgPicture.asset(
                AssetsManager.profiletab,
                colorFilter:
                    ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
              ),
              label: StringsManager.profileTab,
              selectedIcon: SvgPicture.asset(
                AssetsManager.profiletab,
                colorFilter:
                    ColorFilter.mode(Colors.blueAccent, BlendMode.srcIn),
              ),
            )
          ]),
      body: tabs[selectedIndex],
    );
  }
}
