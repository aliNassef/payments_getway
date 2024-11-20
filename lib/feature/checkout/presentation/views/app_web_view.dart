import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'thank_view.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({super.key, required this.url});
  final String url;

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    _initializeController();
    log(widget.url);
  }

  void _initializeController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            log('Loading progress: $progress');
          },
          onPageStarted: (String url) {
            log('Page started loading: $url');
          },
          onPageFinished: (String url) {
            log('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            log('Web resource error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('success')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ThankView(),
                ),
              );
            } else if (request.url.contains('fail')) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('failed'),
                ),
              );
              Navigator.pop(context);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url)); // Load the initial URL.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay'),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
