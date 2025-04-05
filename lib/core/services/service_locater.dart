import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/dependencies/data_source_and_connections.dart';
import 'package:movie_app/core/services/dependencies/init_core.dart';
import 'package:movie_app/core/services/dependencies/init_repo.dart';
import 'package:movie_app/core/services/dependencies/init_use_case.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await initCore();
  await getDataSourcesAndConnections();
  await initRepository();
  await initUseCases();
}