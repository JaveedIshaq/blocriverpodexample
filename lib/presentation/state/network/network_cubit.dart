import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkInfoCubit extends Cubit<ConnectivityResult> {
  NetworkInfoCubit(Connectivity connectivityService)
      : super(ConnectivityResult.wifi) {
    connectivityService.onConnectivityChanged.listen((event) {
      connectionChanged(event);
    });
  }
  connectionChanged(ConnectivityResult result) {
    emit(result);
  }
}

bool isConnected(ConnectivityResult connection) =>
    connection == ConnectivityResult.none;
