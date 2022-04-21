import 'package:deriv_app_sample/bloc/symbol/symbol_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SymbolWidget extends StatefulWidget {
  @override
  _SymbolWidgetState createState() => _SymbolWidgetState();
}

class _SymbolWidgetState extends State<SymbolWidget> {
  String? _dropDownValue;
  double? _price;
  SymbolBloc? _symbolsBloc;
  @override
  void initState() {
    super.initState();
    _symbolsBloc = BlocProvider.of<SymbolBloc>(context)..add(GetSymbolList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SymbolBloc, SymbolState>(
      bloc: _symbolsBloc,
      builder: (context, state) {
        if (state is SymbolLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _dropDownValue,
                    hint: Text('Choose symbol'),
                    items: state.symbols
                        ?.map((symbol) => DropdownMenuItem(
                              child: Text(symbol.displayName!),
                              value: symbol.displayName,
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropDownValue = newValue!;
                        _price = state.symbols!
                            .firstWhere((symbol) =>
                                symbol.displayName == _dropDownValue)
                            .spot;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(_dropDownValue.toString()),
              SizedBox(height: 20.0),
              Text(_price.toString()),
              SizedBox(height: 20.0),
            ],
          );
        } else if (state is SymbolError) {
          return Text("SYMBOL ERROR OCCURED");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
