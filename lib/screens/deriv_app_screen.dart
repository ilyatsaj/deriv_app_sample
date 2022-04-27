import 'package:deriv_app_sample/screens/symbol_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/connection_information.dart';
import 'package:flutter_deriv_api/state/connection/connection_cubit.dart'
    as api;

class DerivApp extends StatefulWidget {
  @override
  _DerivAppState createState() => _DerivAppState();
}

class _DerivAppState extends State<DerivApp> {
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
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text(
              'Deriv App Sample',
              style: TextStyle(color: Colors.redAccent),
            ),
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
      );

  Widget _buildCenterText(String text) => Center(
        child: Text(text),
      );
}
