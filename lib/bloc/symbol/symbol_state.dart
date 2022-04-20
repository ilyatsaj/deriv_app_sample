part of 'symbol_bloc.dart';

abstract class SymbolState {
  const SymbolState();
}

class SymbolInitial extends SymbolState {}

class SymbolLoading extends SymbolState {}

class SymbolLoaded extends SymbolState {
  SymbolLoaded({this.symbols, ActiveSymbol? selectedSymbol})
      : _selectedSymbol = selectedSymbol ?? symbols!.first;

  final List<ActiveSymbol>? symbols;
  final ActiveSymbol? _selectedSymbol;
  ActiveSymbol? get selectedSymbol => _selectedSymbol;
}

class SymbolError extends SymbolState {}
