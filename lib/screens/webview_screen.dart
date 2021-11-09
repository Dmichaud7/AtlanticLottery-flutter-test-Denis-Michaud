import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebviewScreen extends StatefulWidget {
  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  @override
    void initState() {
     super.initState();
         // Enable hybrid composition.
  if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    }
   @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(initialUrl: 'https://www.alc.ca/content/alc-mobile/en.html')
    );
  }
}
