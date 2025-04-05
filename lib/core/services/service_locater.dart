import 'package:get_it/get_it.dart';
import 'package:movie_app/core/services/dependecies/data_source_and_connections.dart';
import 'package:movie_app/core/services/dependecies/init_core.dart';
import 'package:movie_app/core/services/dependecies/init_repo.dart';
import 'package:movie_app/core/services/dependecies/init_usecase.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  await initCore();
  await getDataSourcesAndConnections();
  await initRepository();
  await initUseCases();
}
