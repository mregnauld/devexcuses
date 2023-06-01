import 'package:devexcuses/core/errors/failure.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';

class AddExcuseValidator
{

  ValidatorFailure? isValid(String message, BuildContext context)
  {
    if (message.isEmpty)
    {
      return ValidatorFailure(L10n.get(context).add_excuse_empty_message_error);
    }
    return null;
  }

}
