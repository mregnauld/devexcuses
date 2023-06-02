import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/core/errors/errors.dart';
import 'package:devexcuses/core/http/internal/excuses_mapping.dart';
import 'package:devexcuses/core/http/internal/http_client.dart';
import 'package:dio/dio.dart';

class ExcusesAPI
{
  
  static const _urlBase = "https://matthieuregnauld.fr/test/";
  static const _randomAPI = "random.php";
  static const _addExcuseAPI = "addexcuse.php";
  static const _cleMessage = "message";
  
  final HTTPClient httpClient;
  final ExcusesMapping excusesMapping;
  
  
  ExcusesAPI({
    required this.httpClient,
    required this.excusesMapping});
  
  /// Retourne true si la réponse HTTP est valide.
  bool _isResponseValid(int? statusCode) => (statusCode != null && statusCode >= 200 && statusCode < 300);
  
  /// Propage une erreur selon le code HTTP.
  bool _throwErrorFromStatusCode(int? statusCode)
  {
    if (statusCode == null)
    {
      throw UnknownServerError();
    }
    else if (statusCode >= 300 && statusCode < 400)
    {
      throw ServerRedirectionError();
    }
    else if (statusCode == 403)
    {
      throw ForbiddenAccessError();
    }
    else if (statusCode == 404)
    {
      throw ResourceNotFoundError();
    }
    else if (statusCode >= 500 && statusCode < 600)
    {
      throw InternalServerError();
    }
    else
    {
      throw UnknownServerError();
    }
  }
  
  /// Appel de l'API de génération aléatoire d'excuse.
  Future<ExcuseEntity?> getRandomExcuse() async
  {
    try
    {
      final response = await httpClient.getResponseFromApi(_urlBase + _randomAPI);
      if (_isResponseValid(response.statusCode))
      {
        final data = response.data.toString();
        return excusesMapping.getExcuseEntityFromJSON(data);
      }
      throw UnknownServerError();
    }
    on DioError catch (error)
    {
      _throwErrorFromStatusCode(error.response?.statusCode);
    }
    return null;
  }
  
  /// Appel de l'API d'ajout d'excuse.
  Future<String?> addExcuse(String message) async
  {
    try
    {
      final response = await httpClient.postResponseToApi(_urlBase + _addExcuseAPI, {_cleMessage: message});
      if (_isResponseValid(response.statusCode))
      {
        return response.data;
      }
      throw UnknownServerError();
    }
    on DioError catch (error)
    {
      _throwErrorFromStatusCode(error.response?.statusCode);
    }
    return null;
  }
  
}