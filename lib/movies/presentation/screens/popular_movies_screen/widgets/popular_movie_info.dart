import 'package:flutter/material.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';

class PopularMovieInfo extends StatelessWidget {
  const PopularMovieInfo({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}


