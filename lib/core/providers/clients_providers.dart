import 'package:devexcuses/core/http/connectivity_manager.dart';
import 'package:devexcuses/core/http/excuses_api.dart';
import 'package:devexcuses/core/http/internal/http_client.dart';
import 'package:devexcuses/core/providers/mappings_providers.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final connectivityManagerProvider = Provider<ConnectivityManager>((ref) => ConnectivityManager(
    internetConnectionChecker: InternetConnectionChecker()));
final httpClientProvider = Provider<HTTPClient>((ref) => HTTPClient(dio: Dio()));
final excusesAPIProvider = Provider<ExcusesAPI>((ref) => ExcusesAPI(
    httpClient: ref.watch(httpClientProvider),
    excusesMapping: ref.watch(excusesMappingProvider)));