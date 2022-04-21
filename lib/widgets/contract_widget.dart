import 'package:deriv_app_sample/bloc/contract/contract_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';

class ContractWidget extends StatefulWidget {
  @override
  _ContractWidgetState createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget> {
  ContractBloc? _contractsBloc;
  @override
  void initState() {
    super.initState();
    _contractsBloc = BlocProvider.of<ContractBloc>(context)
      ..add(GetContractList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractBloc, ContractState>(
      bloc: _contractsBloc,
      builder: (context, state) {
        if (state is ContractLoaded) {
          final ContractsForSymbol allContracts = state.contracts!;
          return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: allContracts.availableContracts!.length,
              itemBuilder: (BuildContext context, int index) {
                final AvailableContractModel contract =
                    state.contracts!.availableContracts![index]!;
                return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category: ${contract.contractCategory}',
                            style: TextStyle(fontSize: 22)),
                        Text('Name: ${contract.contractType}',
                            style: TextStyle(fontSize: 18)),
                        Text('Market: ${contract.market}',
                            style: TextStyle(fontSize: 18)),
                        Text('SubMarket: ${contract.submarket}',
                            style: TextStyle(fontSize: 18))
                      ],
                    ));
              });
        } else if (state is ContractError) {
          return Text("CONTRACT ERROR OCCURED");
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
