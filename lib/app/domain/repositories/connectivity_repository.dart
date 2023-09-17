import 'package:fasfin/app/stateManager/notifier.dart';

abstract class ConnectivityRepository extends Notifier {
  Future<bool> get checkInternetConnection;
}
