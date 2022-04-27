part of 'contract_bloc.dart';

abstract class ContractState {
  const ContractState();
}

class ContractInitial extends ContractState {}

class ContractLoading extends ContractState {}

class ContractLoaded extends ContractState {
  ContractLoaded({this.contracts});

  final ContractsForSymbol? contracts;
}

class ContractError extends ContractState {
  final String error;
  ContractError(this.error);
}
