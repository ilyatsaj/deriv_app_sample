import 'package:deriv_app_sample/screens/deriv_app_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(DerivSampleApp());
}

class DerivSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DerivApp(),
    );
  }
}
