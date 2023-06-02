import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/widgets/text/styled_text.dart';
import 'package:devexcuses/core/errors/failure.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WidgetHelper
{

  static void displayMessageIfError(AsyncValue state, WidgetRef ref, BuildContext context)
  {
    if (state is AsyncError && !state.isRefreshing && state.hasError)
    {
      String message;
      if (state.error is Failure)
      {
        message = (state.error as Failure).message;
      }
      else
      {
        message = L10n.get(context).common_internal_error;
      }
      ScaffoldMessenger.of(context).showSnackBar(
          WidgetHelper.getErrorSnackbar(
              message: message,
              context: context));
    }
  }
  
  static SnackBar getErrorSnackbar({required String message, required BuildContext context})
  {
    return SnackBar(
      backgroundColor: ColorsData.error,
      content: StyledText(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }

}