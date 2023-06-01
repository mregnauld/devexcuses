import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/core/errors/failure.dart';
import 'package:devexcuses/core/http/connectivity_manager.dart';
import 'package:devexcuses/core/http/excuses_api.dart';
import 'package:flutter/foundation.dart';

class GenerateExcuseUseCase
{

  final ExcusesAPI excusesAPI;
  final ConnectivityManager connectivityManager;


  GenerateExcuseUseCase({
    required this.excusesAPI,
    required this.connectivityManager,
  });

  Future<Either<Failure, ExcuseEntity>> launch() async
  {
    try
    {
      // test de connexion à internet :
      bool isConnected = await connectivityManager.isConnected();
      if (!isConnected) return Left(ConnectionErrorFailure());
      
      // simulation d'une attente :
      await Future.delayed(Duration(milliseconds: Random().nextInt(4000) + 1000));
      
      // récupération d'une nouvelle excuse :
      final excuseEntity = await excusesAPI.getRandomExcuse();
      return Right(excuseEntity);
    }
    catch (error, stacktrace)
    {
      debugPrintStack(stackTrace: stacktrace, label: "Erreur lors de la génération d'une excuse");
      return Left(InternalErrorFailure());
    }
  }

}