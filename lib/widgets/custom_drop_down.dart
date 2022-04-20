import 'package:deriv_app_sample/bloc/symbol/symbol_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDropDown extends StatefulWidget {
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final String dropdownInitValue = "Select";
  late String dropDownValue;
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
          return InputDecorator(
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropDownValue,
                hint: Text('Choose symbol'),
                items: state.symbols
                    ?.map((symbol) => DropdownMenuItem(
                          child: Text(symbol.displayName!),
                          value: symbol.displayName,
                        ))
                    .toList(),
                onChanged: (String? newValue) {
                  print(newValue);
                  //dropDownValue = newValue!;
                  setState(() {
                    dropDownValue = newValue!;
                    print(dropDownValue);
                  });
                },
              ),
            ),
          );
        } else if (state is SymbolError) {
          return Text("ERROR OCCURED");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
