import 'dart:math';
import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/core/errors/errors.dart';
import 'package:devexcuses/core/http/connectivity_manager.dart';
import 'package:devexcuses/core/http/excuses_api.dart';

class GenerateExcuseUseCase
{

  final ExcusesAPI excusesAPI;
  final ConnectivityManager connectivityManager;


  GenerateExcuseUseCase({
    required this.excusesAPI,
    required this.connectivityManager,
  });

  Future<ExcuseEntity> launch() async
  {
    // test de connexion à internet :
    bool isConnected = await connectivityManager.isConnected();
    if (!isConnected) throw InternetConnectionError();

    // simulation d'une attente :
    await Future.delayed(Duration(milliseconds: Random().nextInt(4000) + 1000));

    // récupération d'une nouvelle excuse :
    final excuseEntity = await excusesAPI.getRandomExcuse();
    return excuseEntity!;
  }

}