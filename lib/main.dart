import 'package:flutter/material.dart';
import 'package:flutter_initializartion/khalti_payment.dart';
import 'package:flutter_initializartion/login.dart';
import 'package:flutter_initializartion/register.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(
    KhaltiScope(
        publicKey: "test_public_key_3de93d50c0c44151986243704eb4c504",
        builder: (context, navigatorKey) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            initialRoute: '/login',
            routes: {
              '/login': (context) => const LoginScreen(),
              '/register': (context) => const RegisterScreen(),
              '/khalti_payment': (context) => const KhaltiPaymentScreen(),
            },
          );
        }),
  );
}
