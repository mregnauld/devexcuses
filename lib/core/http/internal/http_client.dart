import 'package:dio/dio.dart';

class HTTPClient
{
  
  final Dio dio;
  
  
  HTTPClient({required this.dio});
  
  Future<Response> getResponseFromApi(String url) async
  {
    return await dio.get(url);
  }
  
  Future<Response> postResponseToApi(String url, Map<String, dynamic> data) async
  {
    return await dio.post(url, data: FormData.fromMap(data));
  }
  
}