import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_state.dart';
import 'package:movie_app/movies/presentation/screens/popular_movies_screen/widgets/movie_appbar.dart';
import 'package:movie_app/movies/presentation/screens/popular_movies_screen/widgets/popular_movies.dart';
 


class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late List<MovieEntity> movies = [];
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getMovieAppBar(),
      body: BlocBuilder<MoviesCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          }
          if (state is MovieError) {
            return Center(child: Text(state.message));
          }
          if (state is MovieSuccess) {
            movies = state.movies;
            log('${movies.length} movies}');
          }
          return PopularMovies(movies: movies);
        },
      ),
    );
  }
}


