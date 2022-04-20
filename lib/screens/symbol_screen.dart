import 'package:deriv_app_sample/bloc/symbol/symbol_bloc.dart';
import 'package:deriv_app_sample/widgets/symbol_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_drop_down.dart';

class SymbolScreen extends StatefulWidget {
  @override
  _SymbolScreenState createState() => _SymbolScreenState();
}

class _SymbolScreenState extends State<SymbolScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SymbolBloc(),
          ),
        ],
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Active Symbols'),
              SymbolWidget(),
              //CustomDropDown(),
            ],
          ),
        ),
      );
}
