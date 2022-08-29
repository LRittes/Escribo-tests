import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BrowserInApp extends StatefulWidget {
  const BrowserInApp({Key? key}) : super(key: key);

  @override
  State<BrowserInApp> createState() => _BrowserInAppState();
}

class _BrowserInAppState extends State<BrowserInApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.14,
      ),
      width: double.infinity,
      child: InAppWebView(
        initialUrlRequest:
            URLRequest(url: Uri.parse("https://www.starwars.com/community")),
      ),
    );
  }
}
