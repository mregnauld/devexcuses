import 'package:devexcuses/core/errors/errors.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';

class AddExcuseValidator
{

  void validate(String message, BuildContext context)
  {
    if (message.isEmpty)
    {
      throw ValidationError(L10n.get(context).add_excuse_empty_message_error);
    }
  }

}
