import 'package:devexcuses/core/errors/errors.dart';
import 'package:devexcuses/core/http/connectivity_manager.dart';
import 'package:devexcuses/core/http/excuses_api.dart';

class AddExcuseUseCase
{

  final ExcusesAPI excusesAPI;
  final ConnectivityManager connectivityManager;


  AddExcuseUseCase({
    required this.excusesAPI,
    required this.connectivityManager,
  });

  /// Ajout d'une nouvelle excuse.
  Future<void> launch(String message) async
  {
    // test de connexion à internet :
    bool isConnected = await connectivityManager.isConnected();
    if (!isConnected) throw InternetConnectionError();

    // ajout d'une nouvelle excuse :
    final response = await excusesAPI.addExcuse(message);
    if (response != null)
    {
      throw ServerMessageError(response);
    }
  }

}