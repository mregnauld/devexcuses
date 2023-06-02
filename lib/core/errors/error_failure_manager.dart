import 'package:devexcuses/core/errors/errors.dart';
import 'package:devexcuses/core/errors/failure.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';

class ErrorFailureManager
{
  
  Failure getFailureFromError(Object error, BuildContext context)
  {
    if (error is InternetConnectionError)
    {
      return Failure(L10n.get(context).common_internet_error);
    }
    else if (error is ServerRedirectionError)
    {
      return Failure(L10n.get(context).common_server_redirection_error);
    }
    else if (error is InternalServerError)
    {
      return Failure(L10n.get(context).common_internal_server_error);
    }
    else if (error is UnknownServerError)
    {
      return Failure(L10n.get(context).common_unknown_server_error);
    }
    else if (error is ForbiddenAccessError)
    {
      return Failure(L10n.get(context).common_forbidden_access_error);
    }
    else if (error is ResourceNotFoundError)
    {
      return Failure(L10n.get(context).common_resource_not_found_error);
    }
    else if (error is ServerMessageError)
    {
      return Failure(L10n.get(context).common_server_message_error + error.message);
    }
    else if (error is ValidationError)
    {
      return Failure(error.message);
    }
    return Failure(L10n.get(context).common_internal_error);
  }
  
}