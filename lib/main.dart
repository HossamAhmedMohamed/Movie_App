import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/movies/data/data_source/hive_adapter.dart';
import 'package:movie_app/movies/data/data_source/local_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repository.dart';
import 'package:movie_app/movies/data/data_source/remote_data_source.dart';
import 'package:movie_app/movies/presentation/movie_cubit/movie_cubit.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = MoviesRepository(
    remoteDataSource: RemoteDataSource(Dio()),
    localDataSource: LocalDataSource(),
  );

  // await Hive.initFlutter();
  // Hive.registerAdapter(MovieAdapter());

  runApp(BlocProvider(
    create: (context) => MoviesCubit(repository),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(),
      home: MoviesScreen(),
    );
  }
}
