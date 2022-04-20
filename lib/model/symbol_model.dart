// class SymbolModel {
//   List<ActiveSymbols>? activeSymbols;
//   EchoOfRequest? echoOfRequest;
//   String? messageType;
//   String? error;
//
//   SymbolModel({this.activeSymbols, this.echoOfRequest, this.messageType});
//
//   SymbolModel.withError(String errorMessage) {
//     error = errorMessage;
//   }
//
//   SymbolModel.fromJson(Map<String, dynamic> json) {
//     echoOfRequest = json['echo_req'] != null
//         ? new EchoOfRequest.fromJson(json['echo_req'])
//         : null;
//     if (json['active_symbols'] != null) {
//       activeSymbols = [];
//       json['active_symbols'].forEach((v) {
//         activeSymbols!.add(new ActiveSymbols.fromJson(v));
//       });
//     }
//     messageType = json['msg_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.echoOfRequest != null) {
//       data['echo_req'] = this.echoOfRequest!.toJson();
//     }
//     if (this.activeSymbols != null) {
//       data['active_symbols'] =
//           this.activeSymbols!.map((v) => v.toJson()).toList();
//     }
//     data['msg_type'] = this.messageType;
//     return data;
//   }
// }
//
// class ActiveSymbols {
//   bool? allowForwardStarting;
//   String? displayName;
//   bool? exchangeIsOpen;
//   bool? isTradingSuspended;
//   String? market;
//   String? marketDisplayName;
//   double? pip;
//   String? submarket;
//   String? submarketDisplayName;
//   String? symbol;
//   String? symbolType;
//
//   ActiveSymbols(
//       {this.allowForwardStarting,
//       this.displayName,
//       this.exchangeIsOpen,
//       this.isTradingSuspended,
//       this.market,
//       this.marketDisplayName,
//       this.pip,
//       this.submarket,
//       this.submarketDisplayName,
//       this.symbol,
//       this.symbolType});
//
//   ActiveSymbols.fromJson(Map<String, dynamic> json) {
//     allowForwardStarting = json['allow_forward_starting'];
//     displayName = json['display_name'];
//     exchangeIsOpen = json['exchange_is_open'];
//     isTradingSuspended = json['is_trading_suspended'];
//     market = json['market'];
//     marketDisplayName = json['market_display_name'];
//     pip = json['pip'];
//     submarket = json['submarket'];
//     submarketDisplayName = json['submarket_display_name'];
//     symbol = json['symbol'];
//     symbolType = json['symbol_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['allow_forward_starting'] = this.allowForwardStarting;
//     data['display_name'] = this.displayName;
//     data['exchange_is_open'] = this.exchangeIsOpen;
//     data['is_trading_suspended'] = this.isTradingSuspended;
//     data['market'] = this.market;
//     data['market_display_name'] = this.marketDisplayName;
//     data['pip'] = this.pip;
//     data['submarket'] = this.submarket;
//     data['submarket_display_name'] = this.submarketDisplayName;
//     data['symbol'] = this.symbol;
//     data['symbol_type'] = this.symbolType;
//     return data;
//   }
// }
//
// class EchoOfRequest {
//   String? activeSymbols;
//   String? productType;
//
//   EchoOfRequest({this.activeSymbols, this.productType});
//
//   EchoOfRequest.fromJson(Map<String, dynamic> json) {
//     activeSymbols = json['active_symbols'];
//     productType = json['product_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['active_symbols'] = this.activeSymbols;
//     data['product_type'] = this.productType;
//
//     return data;
//   }
// }
