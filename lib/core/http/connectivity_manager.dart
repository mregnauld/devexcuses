import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityManager
{

  final InternetConnectionChecker internetConnectionChecker;
  
  
  ConnectivityManager({required this.internetConnectionChecker});
  
  /// Retourne true si l'utilisateur est bien connecté à Internet.
  Future<bool> isConnected() => internetConnectionChecker.hasConnection;

}