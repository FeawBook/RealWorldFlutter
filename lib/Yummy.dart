import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_world_fluter_project/Constants.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';

class Yummy extends StatefulWidget {
  Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  // TODO: Setup default theme
  ThemeMode themeMode = ThemeMode.light;

  ColorSelection colorSelected = ColorSelection.green;

  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  // TODO: Add changeTheme above here
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy';
    // TODO: Setup default theme

    //3
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner

      // TODO: Add theme
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),

      // TODO: Replace Scaffold with Home widget
      // 4
      home: Scaffold(
        appBar: AppBar(
          // TODO: Add action buttons
          actions: [
            ThemeButton(changeThemeMode: changeThemeMode),
            ColorButton(changeColor: changeColor, colorSelected: colorSelected)
          ],
          elevation: 4.0,
          title: const Text(
            appTitle,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        body: const Center(
          child: Text(
            'You Hungry?😋',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }
}
