import 'package:deriv_app_sample/bloc/contract/contract_bloc.dart';
import 'package:deriv_app_sample/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/api/contract/contracts_for/contracts_for_symbol.dart';
import 'package:flutter_deriv_api/api/contract/models/available_contract_model.dart';

class ContractWidget extends StatefulWidget {
  ContractWidget(ContractBloc? contractsBloc);

  ContractBloc? contractsBloc;

  @override
  _ContractWidgetState createState() => _ContractWidgetState();
}

class _ContractWidgetState extends State<ContractWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContractBloc, ContractState>(
      bloc: widget.contractsBloc,
      builder: (context, state) {
        if (state is ContractLoaded) {
          final ContractsForSymbol allContracts = state.contracts!;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: allContracts.availableContracts!.length,
              itemBuilder: (BuildContext context, int index) {
                final AvailableContractModel contract =
                    state.contracts!.availableContracts![index]!;
                return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                      side: const BorderSide(color: Colors.redAccent, width: 1),
                    ),
                    color: Colors.grey[300],
                    child: Padding(
                      padding: kCardPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$kCategory ${contract.contractCategoryDisplay}',
                              style: kCategoryStyle),
                          Text('$kName ${contract.contractDisplay}',
                              style: kCardStyle),
                          Text('$kMarket ${contract.market}',
                              style: kCardStyle),
                          Text('$kSubmarket ${contract.submarket}',
                              style: kCardStyle)
                        ],
                      ),
                    ));
              });
        } else if (state is ContractError) {
          return const Text(kContractError);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
