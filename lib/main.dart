import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outlook/config.dart';
import 'package:outlook/screens/Welcome/home.dart';
import 'package:outlook/screens/auth/navscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'firebase_options.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = '$STRIPE_KEY';
  await Stripe.instance.applySettings();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  var role = preferences.getString('role');
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/welcome': (context) => HomePage(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    home: kIsWeb
        ? HomePage()
        : email == null
            ? HomePage()
            : NavScreen(email: email, role: role),
  ));
  // WebView.platform = WebWebViewPlatform();

  // runApp(const MaterialApp(home: WebViewExample()));
}
