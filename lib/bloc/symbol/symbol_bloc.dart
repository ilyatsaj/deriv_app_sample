import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'symbol_event.dart';
part 'symbol_state.dart';

class SymbolBloc extends Bloc<SymbolEvent, SymbolState> {
  SymbolBloc() : super(SymbolInitial());
  @override
  Stream<SymbolState> mapEventToState(SymbolEvent event) async* {
    if (event is GetSymbolList) {
      yield SymbolLoading();

      try {
        final List<ActiveSymbol> symbols =
            await ActiveSymbol.fetchActiveSymbols(const ActiveSymbolsRequest(
          activeSymbols: 'brief',
          productType: 'basic',
        ));
        yield SymbolLoaded(symbols: symbols);
      } catch (error) {
        yield SymbolError();
      }
    } else if (event is SelectSymbol) {
      if (state is SymbolLoaded) {
        final SymbolLoaded loadedState = state as SymbolLoaded;

        yield SymbolLoaded(symbols: loadedState.symbols);
      } else {
        yield SymbolLoading();
        add(GetSymbolList());
      }
    }
  }
}
