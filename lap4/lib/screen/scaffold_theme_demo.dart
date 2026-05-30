import 'package:flutter/material.dart';

class ScaffoldThemeDemo extends StatefulWidget {
  const ScaffoldThemeDemo({super.key});

  @override
  State<ScaffoldThemeDemo> createState() =>
      _ScaffoldThemeDemoState();
}

class _ScaffoldThemeDemoState
    extends State<ScaffoldThemeDemo> {

  bool isDark = false;

  @override
  Widget build(BuildContext context) {

    return Theme(
      data:
      isDark
          ? ThemeData.dark()
          : ThemeData.light(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Scaffold & Theme",
          ),
        ),

        body: Center(
          child: SwitchListTile(
            title: const Text(
              "Dark Mode",
            ),
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
              });
            },
          ),
        ),

        floatingActionButton:
        FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(
              const SnackBar(
                content: Text(
                  "FAB Clicked",
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}