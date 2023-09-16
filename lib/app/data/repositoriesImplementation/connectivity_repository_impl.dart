import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fasfin/app/data/services/remote/internet_checker.dart';
import 'package:fasfin/app/domain/repositories/connectivity_repository.dart';

class ConnectivityRepositoryImpl extends ConnectivityRepository {
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;

  ConnectivityRepositoryImpl(
    this._connectivity,
    this._internetChecker,
  );
  @override
  Future<bool> get checkInternetConnection async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return false;

    return _internetChecker.hasInternet();
  }
}
