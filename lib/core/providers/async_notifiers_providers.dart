import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/features/random/presentation/notifiers/random_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final randomNotifierProvider = AutoDisposeAsyncNotifierProvider<RandomNotifier, ExcuseEntity?>(() => RandomNotifier());
