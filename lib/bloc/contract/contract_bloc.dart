import 'dart:async';
import 'package:deriv_app_sample/bloc/symbol/symbol_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/common/active_symbols/active_symbols.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';

import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  ContractBloc(SymbolBloc symbolBloc) : super(ContractLoading()) {
    symbolBloc.stream.listen((SymbolState symbolState) {
      if (symbolState is SymbolLoaded) {
        add(
          GetContractList(
            symbol: symbolState.selectedSymbol,
          ),
        );
      }
    });
  }
  @override
  Stream<ContractState> mapEventToState(ContractEvent event) async* {
    if (event is GetContractList) {
      yield ContractLoading();

      try {
        final ContractsForSymbol contracts =
            await _fetchContracts(event.symbol!);
        yield ContractLoaded(contracts: contracts);
      } on ContractError catch (error) {
        yield ContractError(error.toString());
      }
    } else if (event is SelectContract) {
      if (state is ContractLoaded) {
        final ContractLoaded loadedState = state as ContractLoaded;

        yield ContractLoaded(contracts: loadedState.contracts);
      } else {
        yield ContractLoading();
        add(GetContractList());
      }
    }
  }

  Future<ContractsForSymbol> _fetchContracts(
          ActiveSymbol selectedSymbol) async =>
      ContractsForSymbol.fetchContractsForSymbol(
        ContractsForRequest(contractsFor: selectedSymbol.symbol),
      );
}
