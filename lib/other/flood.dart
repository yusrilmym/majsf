import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Flood extends StatefulWidget {
  @override
  _FloodState createState() => _FloodState();
}

class _FloodState extends State<Flood> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Flood"),
      ),
      body: WebView(
        initialUrl: 'http://192.168.10.67/flood',
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
