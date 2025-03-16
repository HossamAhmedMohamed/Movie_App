import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/core/services/service_locater.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/routing/router_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());
  Hive.registerAdapter(GenreModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterGenerator.mainRouting,
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData.dark(),
    );
  }
}
