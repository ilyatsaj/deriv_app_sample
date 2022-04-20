part of 'symbol_bloc.dart';

abstract class SymbolEvent {
  const SymbolEvent();
}

class GetSymbolList extends SymbolEvent {
  GetSymbolList();
}

class SelectSymbol extends SymbolEvent {
  SelectSymbol(this.index);

  final int index;
}
