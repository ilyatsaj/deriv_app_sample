part of 'symbol_bloc.dart';

abstract class SymbolEvent {}

class GetSymbolList extends SymbolEvent {
  GetSymbolList();
}

class SelectSymbol extends SymbolEvent {
  SelectSymbol(this.selectdEventSymbol);

  final ActiveSymbol? selectdEventSymbol;
}
