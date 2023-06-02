import 'dart:async';
import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/core/providers/managers_providers.dart';
import 'package:devexcuses/core/providers/usecases_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomNotifier extends AutoDisposeAsyncNotifier<ExcuseEntity?>
{

  @override
  FutureOr<ExcuseEntity?> build() => null;


  Future<void> generateExcuse(BuildContext context) async
  {
    try
    {
      // lock :
      if (state is AsyncLoading) return;

      // requète :
      state = const AsyncLoading();
      final excuseEntity = await ref.watch(generateExcuseUseCaseProvider).launch();
      state = AsyncValue.data(excuseEntity);
    }
    catch (error, stacktrace)
    {
      state = AsyncError(
          ref.watch(errorFailureManagerProvider).getFailureFromError(error, context),
          stacktrace);
    }
  }

}