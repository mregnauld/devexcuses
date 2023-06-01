import 'package:devexcuses/core/providers/clients_providers.dart';
import 'package:devexcuses/features/add/domain/usecases/add_excuse_usecase.dart';
import 'package:devexcuses/features/random/domain/usecases/generate_excuse_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final generateExcuseUseCaseProvider = Provider<GenerateExcuseUseCase>((ref) => GenerateExcuseUseCase(
    excusesAPI: ref.watch(excusesAPIProvider),
    connectivityManager: ref.watch(connectivityManagerProvider)));
final addExcuseUseCaseProvider = Provider<AddExcuseUseCase>((ref) => AddExcuseUseCase(
    excusesAPI: ref.watch(excusesAPIProvider),
    connectivityManager: ref.watch(connectivityManagerProvider)));
