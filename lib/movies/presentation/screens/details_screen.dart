import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_state.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.year,
      required this.rating,
      required this.id});

  final String imgUrl;
  final String title;
  final String description;
  final String year;
  final String rating;
  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<GenreModel> genres = [];
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).fetchMovieDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height / 3,
                  fit: BoxFit.cover,
                  imageUrl: widget.imgUrl,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[850]!,
                    highlightColor: Colors.grey[800]!,
                    child: Container(
                      height: MediaQuery.sizeOf(context).width / 2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  left: 5,
                  child: SafeArea(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 3),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          color: Color(0xFF585858),
                        ),
                        child: Text(
                          widget.year,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        widget.rating,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text('1h  40m')
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(widget.description,
                      style: const TextStyle(fontSize: 16.0)),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<MoviesCubit, MovieState>(
                    builder: (context, state) {
                      if (state is MovieDetailsSuccess) {
                        genres = state.movieDetails;
                        log(genres.toString());
                      }
                      return Row(
                        children: [
                          Text(
                            'Genres:',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(width: 8),
                          if (genres.isNotEmpty)
                            ...genres.map((genre) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                     genre.name,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
