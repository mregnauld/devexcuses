import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityManager
{

  final InternetConnectionChecker internetConnectionChecker;
  
  
  ConnectivityManager({required this.internetConnectionChecker});
  
  Future<bool> isConnected() async
  {
    return await internetConnectionChecker.hasConnection;
  }

}