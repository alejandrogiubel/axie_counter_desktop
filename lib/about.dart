import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final carouselController = CarouselController();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                height: 180,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
              ),
              items: [
                getQr(context, 'Bitcoin address for donations', 'assets/qr_bitcoin.jpg', 'bc1qpslswzd57xpcel9t9g7daec703c324fm39h0yk4tts4d2ewgpa2szjm67w'),
                getQr(context, 'Ethereum address for donations', 'assets/qr_eth.jpg', '0x9e3b30C43C0F9ab0bcd71bddeF53be404f604652'),
                getQr(context, 'QvaPay address for donations', 'assets/qr_sqp.jpg', 'https://qvapay.com/payme/agiubel'),
              ]
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => carouselController.previousPage(),
                  child: const Icon(CupertinoIcons.left_chevron)
                ),
                ElevatedButton(
                  onPressed: () => carouselController.nextPage(),
                  child: const Icon(CupertinoIcons.right_chevron)
                )
              ],
            ),

            const SizedBox(height: 10,),
            InkWell(
              onTap: () => launch('https://telegram.me/agiubel'),
              child: const Text('Contact me')
            )
          ],
        ),
      ),
    );
  }

  getQr(BuildContext context, String text, String assetPath, String qrContent) {
    return Column(
      children: [
        Text(text),
        const SizedBox(height: 10,),
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: qrContent));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Address copied to clipboard'),
              ),
            );
          },
          child: Image.asset(assetPath,
            height: 150,
          ),
        ),
      ],
    );
  }
}
