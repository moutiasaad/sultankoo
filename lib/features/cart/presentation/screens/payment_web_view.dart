import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/widgets/top_app_bar.dart';

class PaymentWebView extends StatefulWidget {
  final String bearerToken;

  const PaymentWebView({super.key, required this.bearerToken});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {},
              onPageStarted: (String url) {
                setState(() {
                  _isLoading = true;
                });
              },
              onPageFinished: (String url) {
                setState(() {
                  _isLoading = false;
                });
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.contains(
                  'https://tshl.me/s/sultankoo/orders',
                )) {
                  Navigator.pop(context, true);
                  return NavigationDecision.prevent;
                } else if (request.url.contains(
                  'https://www.sultankootshl.xyz/orders',
                )) {
                  Navigator.pop(context, true);
                  return NavigationDecision.prevent;
                } else {
                  return NavigationDecision.navigate;
                }
              },
            ),
          )
          ..loadRequest(
            Uri.parse('https://tshl.me/api/store/sultankoo/payment'),
            headers: {'Authorization': 'Bearer ${widget.bearerToken}'},
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(title: 'إتمام عملية الدفع'),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
