import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable
{
  final List<Object> properties;
  final StackTrace stackTrace = StackTrace.current;

  Failure([this.properties = const <Object>[]]);

  @override
  List<Object> get props => properties;
}

abstract class BasicMessageFailure extends Failure {}

/// Erreurs générales.
class InternalErrorFailure extends BasicMessageFailure {}
class ConnectionErrorFailure extends BasicMessageFailure {}

/// Erreur validation.
class ValidatorFailure extends Failure
{
  final String message;
  ValidatorFailure(this.message);

  @override
  List<Object> get props => [message];
}
