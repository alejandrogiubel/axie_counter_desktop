import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:axie_counter_desktop/home.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async{
    await windowManager.setAsFrameless();
    await windowManager.setAlwaysOnTop(true);
    await windowManager.setSize(const Size(300, 300));
    await windowManager.setMinimumSize(const Size(300, 300));
    await windowManager.center();
    await windowManager.setHasShadow(true);
    await windowManager.setTitle('Axie Counter');
    await windowManager.setResizable(false);
    windowManager.show();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      child: MaterialApp(
        title: 'Axie Counter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
      ),
    );
  }
}
