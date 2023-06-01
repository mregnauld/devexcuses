import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/core/http/internal/excuses_mapping.dart';
import 'package:devexcuses/core/http/internal/http_client.dart';

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
  
  Future<ExcuseEntity> getRandomExcuse() async
  {
    final response = await httpClient.getResponseFromApi(_urlBase + _randomAPI);
    final data = response.data.toString();
    return excusesMapping.getExcuseEntityFromJSON(data);
  }
  
  Future<String?> addExcuse(String message) async
  {
    final response = await httpClient.postResponseToApi(_urlBase + _addExcuseAPI, {_cleMessage: message});
    return response.data;
  }
  
}