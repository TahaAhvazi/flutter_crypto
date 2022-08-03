import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CryptoDetail extends StatelessWidget {
  const CryptoDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://www.tradingview.com/symbols/BTCUSD/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
