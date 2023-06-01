import 'dart:async';
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
    // validation :
    final validationFailure = ref.watch(addExcuseValidatorProvider).isValid(message, context);
    if (validationFailure != null)
    {
      state = AsyncError(validationFailure, validationFailure.stackTrace);
      return;
    }
    
    // lock :
    if (state is AsyncLoading) return;

    // requète :
    state = const AsyncLoading();
    final failure = await ref.watch(addExcuseUseCaseProvider).launch(message);
    
    // retour :
    if (failure != null)
    {
      state = AsyncError(failure, failure.stackTrace);
    }
    else
    {
      state = const AsyncValue.data(true);
    }
  }

}