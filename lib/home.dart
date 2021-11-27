import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:axie_counter_desktop/widgets/axie_button.dart';
import 'package:axie_counter_desktop/widgets/close_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> languajes = [
    'Espanol',
    'English'
  ];
  bool darkMode = false;
  int count = 3;


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Axie Counter'),
          actions: const [
            AxieCloseButton()
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/energy.png',
                    height: 50,
                  ),
                  const SizedBox(width: 10,),
                  Text('$count',
                    style: const TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AxieButton(
                  title: 'Sumar',
                  assetDecoration: 'assets/axie_button_1.svg',
                  onPress: () => setState(() {
                    count++;
                  })
                ),
                AxieButton(
                  title: 'Restar',
                  assetDecoration: 'assets/axie_button_2.svg',
                  onPress: () => setState(() {
                    if(count > 0) {
                      count--;
                    }
                  }),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AxieButton(
                  title: 'Sumar 2',
                  assetDecoration: 'assets/axie_button_3.svg',
                  onPress: () => setState(() {
                    count = count + 2;
                  })
                ),
                AxieButton(
                  title: 'Reiniciar',
                  assetDecoration: 'assets/axie_button_4.svg',
                  onPress: () => setState(() {
                    count = 3;
                  })
                ),
              ],
            )
          ],
        ),
        bottomSheet: Row(
          children: [
            const Text('Tiempo jugando'),
            const Spacer(),
            ThemeSwitcher(
              builder: (context) {
                return Switch(
                  value: darkMode,
                  onChanged: (value) {
                    ThemeSwitcher.of(context).changeTheme(
                      theme: ThemeProvider.of(context).brightness ==
                          Brightness.light ? ThemeData.dark() : ThemeData.light(),
                      reverseAnimation: false
                    );
                    setState(() {
                      darkMode = value;
                    });
                  }
                );
              },
            ),
            // DropdownButton<String>(
            //   value: selectedLanguaje,
            //   items: languajes.map((e) => DropdownMenuItem(
            //     value: e,
            //     child: Text(e)
            //   )).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       selectedLanguaje = newValue!;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }

}
