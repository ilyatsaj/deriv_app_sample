part of 'contract_bloc.dart';

abstract class ContractState {
  const ContractState();
}

class ContractInitial extends ContractState {}

class ContractLoading extends ContractState {}

class ContractLoaded extends ContractState {
  ContractLoaded({this.contracts, AvailableContractModel? selectedContract})
      : _selectedContract =
            selectedContract ?? contracts!.availableContracts!.first;

  final ContractsForSymbol? contracts;
  final AvailableContractModel? _selectedContract;
  AvailableContractModel? get selectedContract => _selectedContract;
}

class ContractError extends ContractState {
  final String error;
  ContractError(this.error);
}
