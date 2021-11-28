import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class AxieThemeSwitcher extends StatefulWidget {
  const AxieThemeSwitcher({Key? key}) : super(key: key);

  @override
  _AxieThemeSwitcherState createState() => _AxieThemeSwitcherState();
}

class _AxieThemeSwitcherState extends State<AxieThemeSwitcher> {
  bool darkMode = false;
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      builder: (context) {
        return Switch(
          value: darkMode,
          onChanged: (value) {
            ThemeSwitcher.of(context).changeTheme(
              theme: !value ? ThemeData.light() : ThemeData.dark(),
            );
            setState(() {
              darkMode = value;
            });
          }
        );
      },
    );
  }
}
