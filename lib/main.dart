import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:axie_counter_desktop/home.dart';
import 'package:axie_counter_desktop/style/theme.dart';
import 'package:axie_counter_desktop/widgets/app_download.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async{
    await windowManager.setAsFrameless();
    await windowManager.setAlwaysOnTop(true);
    await windowManager.setSize(const Size(300, 300));
    await windowManager.setMinimumSize(const Size(300, 300));
    await windowManager.setHasShadow(true);
    await windowManager.setTitle('Axie Counter');
    await windowManager.setResizable(false);
    windowManager.show();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<bool> canInit() async {
    bool canInit = true;
    const storage = FlutterSecureStorage();
    String? deviceId = await PlatformDeviceId.getDeviceId;

    String? storedDeviceId = await storage.read(key: 'device_id');
    if (storedDeviceId != null) {
      if (deviceId == storedDeviceId) {
        //iniciar la app
        canInit = true;
      } else {
        //mostrar cartel de q no puede iniciar
        canInit = false;
      }
    } else {
      if (deviceId != null) {
        storage.write(key: 'device_id', value: deviceId);
      }
    }
    return canInit;
  }
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: lightTheme,
      child: MaterialApp(
        title: 'Axie Counter',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: FutureBuilder(
          future: canInit(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == true) {
                return const Home();
              } else {
                return const AppDownload();
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}
