import 'package:deriv_app_sample/screens/deriv_app_screen.dart';
import 'package:deriv_app_sample/screens/symbol_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DerivApp(),
    );
  }
}
