import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OrderTrackingWebView extends StatefulWidget {
  const OrderTrackingWebView({super.key, required this.url});
  final String url;

  @override
  State<OrderTrackingWebView> createState() => _OrderTrackingWebViewState();
}

class _OrderTrackingWebViewState extends State<OrderTrackingWebView> {
  late final WebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) => setState(() => _loading = false),
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
    // Title text with white color
    title: const Text(
    'تتبع الشحنة',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.blue, // pick the color you want
    iconTheme: const IconThemeData(color: Colors.white), // makes the back arrow white too
    leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.pop(context); // returns to previous page
    },
    ),
    ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_loading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
