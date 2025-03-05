import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';
import 'package:movie_app/movies/presentation/movie_cubit/movie_cubit.dart';
import 'package:movie_app/movies/presentation/movie_cubit/movie_state.dart';
import 'package:movie_app/movies/presentation/screens/details_screen.dart';
import 'package:shimmer/shimmer.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late List<MovieModel> movies = [];
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text('Popular Movies')),
      body: BlocBuilder<MoviesCubit, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MovieError) {
            return Center(child: Text(state.message));
          }
          if (state is MovieSuccess) {
            movies = state.movies;
            log('${movies.length} movies}');
            // return Center(
            //   child: Text('Movies loaded successfully'),
            // );
          }
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: ListView.builder(
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              itemCount: 20,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(imgUrl: '', title: '', description: '',)));
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              width: 120.0,
                              height: 170.0,
                              fit: BoxFit.cover,
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                width: 120.0,
                                height: 170.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              color: Colors.red),
                                          child: Text(
                                            movie.releaseDate.split('-').first,
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text((10 - movie.voteAverage)
                                          .toStringAsFixed(1)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    movie.overview,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
