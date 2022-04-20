import 'package:deriv_app_sample/bloc/symbol/symbol_bloc.dart';
import 'package:deriv_app_sample/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SymbolWidget extends StatefulWidget {
  @override
  _SymbolWidgetState createState() => _SymbolWidgetState();
}

class _SymbolWidgetState extends State<SymbolWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomDropDown(),
    );
  }
}
