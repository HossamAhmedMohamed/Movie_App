import 'package:flutter/material.dart';

class MovieDetailsDescription extends StatelessWidget {
  const MovieDetailsDescription({
    super.key,
    required this.year,
    required this.rating,
  });

  final String year;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Color(0xFF585858),
          ),
          child: Text(
            year,
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
          rating,
          style: const TextStyle(fontSize: 16.0),
        ),
        SizedBox(
          width: 16,
        ),
        Text('1h  40m')
      ],
    );
  }
}
