part of 'contract_bloc.dart';

abstract class ContractEvent {}

class GetContractList extends ContractEvent {
  GetContractList({this.symbol});

  final ActiveSymbol? symbol;
}

class SelectContract extends ContractEvent {
  SelectContract(this.index);

  final int index;
}
