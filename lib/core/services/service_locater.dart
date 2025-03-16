import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
}