import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KWebView extends StatefulWidget {
  const KWebView({
    super.key,
    required this.url,
    required this.onSuccess,
    required this.onFail,
  });

  final String url;
  final Function() onSuccess, onFail;

  @override
  State<KWebView> createState() => _KWebViewState();
}

class _KWebViewState extends State<KWebView> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url_val) {
            debugPrint('========= On Page Finished ======= ${widget.url} : ');
            if (url_val.toLowerCase().contains('success')) {
              widget.onSuccess.call();
              debugPrint('========= On Page Finished  (onSuccess) ======= ${widget.url}');
            } else if (url_val.toLowerCase().contains("fail")) {
              debugPrint('========= On Page Finished  (onFail) ======= ${widget.url}');
              widget.onFail.call();
            }
          },

        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: controller),
    );
  }
}
