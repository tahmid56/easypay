import 'package:easypay/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:easypay/common/utils/utils.dart';

class MorePage extends ConsumerWidget {
  const MorePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "More",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              const url = 'https://easypayltd.com/howitworks/';
              if (!await launchUrl(Uri.parse(url))) {
                showSnackBar(context, "Couldn't launch the url!");
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.293,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/images/poster.png",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ref.watch(pageIndexProvider.notifier).state = 1;
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/images/adProduct.png",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              const url = 'https://easypayltd.com/faqs/';
              if (!await launchUrl(Uri.parse(url))) {
                showSnackBar(context, "Couldn't launch the url!");
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "assets/images/faq.png",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
