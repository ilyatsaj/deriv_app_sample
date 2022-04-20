import 'package:deriv_app_sample/bloc/symbol/symbol_bloc.dart';
import 'package:deriv_app_sample/screens/symbol_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
    as api;

class DerivApp extends StatefulWidget {
  @override
  _DerivAppState createState() => _DerivAppState();
}

class _DerivAppState extends State<DerivApp> {
  // final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   _api!.connect(
  //     ConnectionInformation(
  //       appId: '1089',
  //       brand: 'deriv',
  //       endpoint: 'green.binaryws.com',
  //       //language: ...,
  //     ),
  //   );
  // }

  late api.ConnectionCubit _connectionCubit;

  @override
  void initState() {
    super.initState();

    _connectionCubit = api.ConnectionCubit(
      ConnectionInformation(
        appId: '1089',
        brand: 'binary',
        endpoint: 'frontend.binaryws.com',
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<api.ConnectionCubit>.value(
            value: _connectionCubit,
          ),
        ],
        // providers: [
        //   BlocProvider<SymbolBloc>(
        //     create: (BuildContext context) => SymbolBloc(),
        //   ),
        // BlocProvider<ContractBloc>(
        //   create: (BuildContext context) => ContractBloc(),
        // ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Deriv App Sample'),
          ),
          body: BlocBuilder<api.ConnectionCubit, api.ConnectionState>(
            builder: (
              BuildContext context,
              api.ConnectionState state,
            ) {
              if (state is api.ConnectionConnectedState) {
                return SymbolScreen();
              } else if (state is api.ConnectionInitialState ||
                  state is api.ConnectionConnectingState) {
                return _buildCenterText('Connecting...');
              } else if (state is api.ConnectionErrorState) {
                return _buildCenterText('Connection Error\n${state.error}');
              } else if (state is api.ConnectionDisconnectedState) {
                return _buildCenterText(
                  'Connection is down, trying to reconnect...',
                );
              }

              return Container();
            },
          ),
        ),
        // child: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Deriv App Sample'),
        //   ),
        //   body: BlocBuilder<SymbolBloc, SymbolState>(
        //     builder: (context, state) {
        //       if (state is SymbolLoaded) {
        //         return SymbolScreen();
        //       } else if (state is SymbolLoading) {
        //         return _buildCenterText('Connecting...');
        //       } else if (state is SymbolError) {
        //         return _buildCenterText('Connection Error');
        //       }
        //
        //       return SymbolScreen();
        //     },
        //   ),
        // ),
      );

  Widget _buildCenterText(String text) => Center(
        child: Text(text),
      );
}
