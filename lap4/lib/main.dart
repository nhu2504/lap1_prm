import 'package:flutter/material.dart';

import 'screen/core_widgets_demo.dart';
import 'screen/input_controls_demo.dart';
import 'screen/layout_demo.dart';
import 'screen/scaffold_theme_demo.dart';
import 'screen/debug_fix_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4 UI Fundamentals',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 4 Flutter UI"),
      ),
      body: ListView(
        children: [

          ListTile(
            title: const Text("Exercise 1"),
            subtitle: const Text("Core Widgets"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CoreWidgetsDemo(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text("Exercise 2"),
            subtitle: const Text("Input Widgets"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const InputControlsDemo(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text("Exercise 3"),
            subtitle: const Text("Layout Composition"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LayoutDemo(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text("Exercise 4"),
            subtitle: const Text("Scaffold & Theme"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ScaffoldThemeDemo(),
                ),
              );
            },
          ),

          ListTile(
            title: const Text("Exercise 5"),
            subtitle: const Text("Debug & Fix"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DebugFixDemo(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}