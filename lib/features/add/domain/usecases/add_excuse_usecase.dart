import 'package:devexcuses/core/errors/failure.dart';
import 'package:devexcuses/core/http/connectivity_manager.dart';
import 'package:devexcuses/core/http/excuses_api.dart';
import 'package:flutter/foundation.dart';

class AddExcuseUseCase
{

  final ExcusesAPI excusesAPI;
  final ConnectivityManager connectivityManager;


  AddExcuseUseCase({
    required this.excusesAPI,
    required this.connectivityManager,
  });

  Future<Failure?> launch(String message) async
  {
    try
    {
      // test de connexion à internet :
      bool isConnected = await connectivityManager.isConnected();
      if (!isConnected) return ConnectionErrorFailure();

      // ajout d'une nouvelle excuse :
      final response = await excusesAPI.addExcuse(message);
      if (response != null)
      {
        return ServerFailure(response);
      }
      return null;
    }
    catch (error, stacktrace)
    {
      debugPrintStack(stackTrace: stacktrace, label: "Erreur lors de l'ajout d'une excuse");
      return InternalErrorFailure();
    }
  }

}