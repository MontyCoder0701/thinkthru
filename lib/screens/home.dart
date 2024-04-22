import 'package:flutter/material.dart';

import 'rule/rule.dart';
import 'thought/thought.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _mainScreens = [
    ThoughtListScreen(),
    RuleListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology_alt_outlined),
            label: 'Thoughts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gavel_outlined),
            label: 'Rules',
          ),
        ],
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
