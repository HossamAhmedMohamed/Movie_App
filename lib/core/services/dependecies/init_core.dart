import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/services/service_locater.dart';

Future<void> initCore() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
}