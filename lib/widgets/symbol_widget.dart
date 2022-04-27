import 'package:deriv_app_sample/bloc/contract/contract_bloc.dart';
import 'package:deriv_app_sample/bloc/symbol/symbol_bloc.dart';
import 'package:deriv_app_sample/widgets/contract_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes.dart';

class SymbolWidget extends StatefulWidget {
  @override
  _SymbolWidgetState createState() => _SymbolWidgetState();
}

class _SymbolWidgetState extends State<SymbolWidget> {
  String? _dropDownValue;
  SymbolBloc? _symbolsBloc;
  ContractBloc? _contractsBloc;

  bool isSymbolSelected = false;

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
              const Text(
                kActiveSymbolsLabel,
                style: kGeneralLabelStyle,
              ),
              const SizedBox(height: kGeneralSizedBoxHeight),
              InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(kGeneralBorderRadius)),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _dropDownValue,
                    hint: const Text(kChooseSymbolLabel),
                    items: state.symbols
                        ?.map(
                          (symbol) => DropdownMenuItem(
                            child: Text(symbol.displayName!),
                            value: symbol.displayName!,
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) async {
                      setState(() {
                        _dropDownValue = newValue!;
                        isSymbolSelected = true;
                        var _symbol = state.symbols!.firstWhere(
                            (symbol) => symbol.displayName == _dropDownValue);

                        BlocProvider.of<SymbolBloc>(context)
                            .add(SelectSymbol(_symbol));
                        _contractsBloc = BlocProvider.of<ContractBloc>(context)
                          ..add(GetContractList(symbol: _symbol));
                      });
                    },
                  ),
                ),
              ),
              if (isSymbolSelected)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: kGeneralSizedBoxHeight),
                    Text('$kSymbolName ${state.selectedSymbol?.symbol}'),
                    const SizedBox(height: kGeneralSizedBoxHeight),
                    Text('$kPrice ${state.selectedSymbol?.spot?.toString()}'),
                    const SizedBox(height: kGeneralSizedBoxHeight),
                    const SizedBox(height: kGeneralSizedBoxHeight),
                    const Text(
                      kAvailableContractsLabel,
                      style: kGeneralLabelStyle,
                    ),
                    const SizedBox(height: kGeneralSizedBoxHeight),
                    ContractWidget(_contractsBloc),
                  ],
                ),
            ],
          );
        } else if (state is SymbolError) {
          return const Text(kSymbolError);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
