import 'package:dio/dio.dart';

class HTTPClient
{
  
  final Dio dio;
  
  
  HTTPClient({required this.dio});
  
  Future<Response> getResponseFromApi(String url) async => await dio.get(url);
  Future<Response> postResponseToApi(String url, Object data) async => await dio.post(url, data: data);
  
}