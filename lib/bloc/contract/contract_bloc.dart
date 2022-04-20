import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/operation/contract.dart';

import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'contract_event.dart';
part 'contract_state.dart';

class ContractBloc extends Bloc<ContractEvent, ContractState> {
  ContractBloc(ContractState initialState) : super(initialState);
  //ContractBloc() : super(ContractInitial());
  // @override
  // Stream<ContractState> mapEventToState(ContractEvent event) async* {
  //   if (event is GetContractList) {
  //     yield ContractLoading();
  //
  //     try {
  //       final List<Contract> symbols = await _fetchContracts();
  //       yield ContractLoaded(contracts: contracts);
  //     } on ContractError catch (error) {
  //       yield ContractError(error.message);
  //     }
  //   } else if (event is SelectContract) {
  //     if (state is ContractLoaded) {
  //       final ContractLoaded loadedState = state as ContractLoaded;
  //
  //       yield ContractLoaded(contracts: loadedState.contracts);
  //     } else {
  //       yield ContractLoading();
  //       add(GetContractList());
  //     }
  //   }
  // }
  //
  // Future<List<ContractsForSymbol>> _fetchContracts() async =>
  //     ContractsForSymbol.fetchContractsForSymbol();
}
