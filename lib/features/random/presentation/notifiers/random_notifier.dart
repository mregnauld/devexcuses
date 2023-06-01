import 'dart:async';
import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/core/providers/usecases_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomNotifier extends AutoDisposeAsyncNotifier<ExcuseEntity?>
{

  @override
  FutureOr<ExcuseEntity?> build() => null;


  Future<void> generateExcuse() async
  {
    // lock :
    if (state is AsyncLoading) return;

    // requète :
    state = const AsyncLoading();
    final useCaseEither = await ref.watch(generateExcuseUseCaseProvider).launch();
    state = useCaseEither.fold(
            (failure) => AsyncError(failure, failure.stackTrace),
            (result) => AsyncValue.data(result));
  }

}