import 'package:axie_counter_desktop/widgets/close_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDownload extends StatelessWidget {
  const AppDownload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            AxieCloseButton()
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Esta app solo se puede ejecutar en un único dispositivo luego de su compra. Por favor descargue la app desde:',
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    launch('https://agiubel.slyk.io/');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Slyk'),
                  )
                )
              ],
            ),
          )
        )
      ),
    );
  }
}
