// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';

// class Test_webview extends StatefulWidget {
//   const Test_webview({Key? key}) : super(key: key);

//   @override
//   State<Test_webview> createState() => _Test_webviewState();
// }

// class _Test_webviewState extends State<Test_webview> {
//   late Completer<WebViewController> _controller;
//   // Completer<WebViewController>();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(builder: (BuildContext context) {
//         return WebView(
//           initialUrl: 'https://illmobile.tk/str/index.php?price=354&doctor=abc',
//           javascriptMode: JavascriptMode.unrestricted,
//           onWebViewCreated: (WebViewController webViewController) {
//             _controller.complete(webViewController);
//           },
//           // onProgress: (int progress) {
//           //   print("WebView is loading (progress : $progress%)");
//           // },
//           // javascriptChannels: <JavascriptChannel>{
//           //   _toasterJavascriptChannel(context),
//           // },
//           // navigationDelegate: (NavigationRequest request) {
//           //   if (request.url.startsWith('https://www.youtube.com/')) {
//           //     print('blocking navigation to $request}');
//           //     return NavigationDecision.prevent;
//           //   }
//           //   print('allowing navigation to $request');
//           //   return NavigationDecision.navigate;
//           // },
//           // onPageStarted: (String url) {
//           //   print('Page started loading: $url');
//           // },
//           // onPageFinished: (String url) {
//           //   print('Page finished loading: $url');
//           // },
//           // gestureNavigationEnabled: true,
//           // geolocationEnabled: false, //support geolocation or not
//         );
//       }),
//     );
//   }
// }
