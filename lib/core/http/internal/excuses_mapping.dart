import 'dart:convert';
import 'package:devexcuses/core/entities/excuse_entity.dart';

class ExcusesMapping
{

  static const _httpCode = "http_code";
  static const _tag = "tag";
  static const _message = "message";
  
  
  ExcuseEntity getExcuseEntityFromJSON(String json)
  {
    final jsonMap = jsonDecode(json);
    return ExcuseEntity(
        httpCode: jsonMap[_httpCode] as int,
        tag: jsonMap[_tag] as String,
        message: jsonMap[_message] as String);
  }
  
}