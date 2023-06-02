
class InternetConnectionError extends Error {}
class ServerRedirectionError extends Error {}
class InternalServerError extends Error {}
class UnknownServerError extends Error {}
class ForbiddenAccessError extends Error {}
class ResourceNotFoundError extends Error {}
class ServerMessageError extends Error
{
  final String message;
  ServerMessageError(this.message);
}
class ValidationError extends Error
{
  final String message;
  ValidationError(this.message);
}
