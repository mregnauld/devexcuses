import 'package:equatable/equatable.dart';

class ExcuseEntity extends Equatable
{
  
  final int httpCode;
  final String tag;
  final String message;
  
  
  const ExcuseEntity({
    required this.httpCode,
    required this.tag,
    required this.message,
  });
  
  @override
  List<Object?> get props => [
    httpCode,
    tag,
    message];
  
}