import 'package:movie_app/core/connection/network_info.dart';
import 'package:movie_app/core/services/service_locater.dart';
import 'package:movie_app/movies/data/data_source/local_data_source/local_data_source.dart';
import 'package:movie_app/movies/data/data_source/remote_data_source/remote_data_source.dart';

Future<void> getDataSourcesAndConnections() async {
  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSource());

  // Network Info
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo());
  
}