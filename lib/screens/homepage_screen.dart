import 'package:bora_caminhar/constants/constant.dart';
import 'package:bora_caminhar/screens/achievement.dart';
import 'package:bora_caminhar/screens/health.dart';
import 'package:bora_caminhar/screens/history.dart';
import 'package:bora_caminhar/screens/meditation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: _Tabs(),
          ),
        ],
      ),
    );
  }
}

class _Tabs extends StatefulWidget {
  const _Tabs({super.key});

  @override
  State<_Tabs> createState() => __TabsState();
}

class __TabsState extends State<_Tabs> {
  int tabIndex = 0;

  void setTabIndex(int value) {
    setState(() {
      tabIndex = value;
    });
  }

  Widget tabOption() {
    switch (tabIndex) {
      case 0:
        return HealthWidget();
      case 1:
        return MeditationWidget();
      case 3:
        return AchievementWidget();
      case 4:
        return HistoryWidget();
      default:
        return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(tabIndex);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _TabsButtonWidget(
            currentTab: tabIndex, setCurrentTab: (index) => setTabIndex(index)),
        Visibility(
          visible: tabIndex != 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Theme.of(context).colorScheme.background,
            ),
            child: tabOption(),
          ),
        ),
      ],
    );
  }
}

class _TabsButtonWidget extends StatelessWidget {
  /// This widget represents the bottom tab
  ///
  /// This widget displays a container with a background color and rounded corners
  /// that contains a row with 5 button tabs represented by [_TabButton]
  ///
  /// It has 2 parameters:
  /// - [currentTab]: Ccurrent tab index, the option that has been selected
  /// - [setCurrentTab]: Function to set the current tab index
  const _TabsButtonWidget({
    super.key,
    required this.currentTab,
    required this.setCurrentTab,
  });
  final int currentTab;
  final Function(int) setCurrentTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (int i = 0; i < 5; i++) ...[
            Expanded(
              child: GestureDetector(
                onTap: () => setCurrentTab(i),
                child: _TabButton(
                  isCurrentTab: i == currentTab,
                  svgAndTitle: tabOption[i],
                ),
              ),
            )
          ]
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  /// This widget represents the tab button, it contains a column with svg icon
  /// and title
  ///
  /// if the tab is selected, the svg icon colors changes to primary color, if it
  /// is not will change to white
  ///
  /// It has 2 parameters:
  /// - [svgAndTitle]: A map with the svg location and the title option
  ///   - `svg`: The location of the SVG asset.
  ///   - `title`: The title of the tab option.
  /// - [isCurrentTab]: Determines if is the current tab
  const _TabButton(
      {super.key, required this.svgAndTitle, required this.isCurrentTab});
  final Map<String, String> svgAndTitle;
  final bool isCurrentTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgAndTitle["svg"]!,
          height: 27,
          colorFilter: ColorFilter.mode(
              isCurrentTab
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
              BlendMode.srcIn),
        ),
        Text(
          svgAndTitle["title"]!,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
