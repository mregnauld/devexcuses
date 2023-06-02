import 'package:devexcuses/core/errors/error_failure_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final errorFailureManagerProvider = Provider<ErrorFailureManager>((ref) => ErrorFailureManager());
