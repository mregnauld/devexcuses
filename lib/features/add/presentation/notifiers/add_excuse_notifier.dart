import 'dart:async';
import 'package:devexcuses/core/providers/managers_providers.dart';
import 'package:devexcuses/core/providers/usecases_providers.dart';
import 'package:devexcuses/core/providers/validators_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExcuseNotifier extends AutoDisposeAsyncNotifier<bool>
{

  @override
  FutureOr<bool> build() => false;


  Future<void> addExcuse(String message, BuildContext context) async
  {
    try
    {
      // validation :
      ref.watch(addExcuseValidatorProvider).validate(message, context);

      // lock :
      if (state is AsyncLoading) return;

      // requète :
      state = const AsyncLoading();
      await ref.watch(addExcuseUseCaseProvider).launch(message);
      state = const AsyncValue.data(true);
    }
    catch (error, stacktrace)
    {
      state = AsyncError(
          ref.watch(errorFailureManagerProvider).getFailureFromError(error, context),
          stacktrace);
    }
  }

}