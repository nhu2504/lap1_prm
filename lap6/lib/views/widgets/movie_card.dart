import 'package:flutter/material.dart';
import '../../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(
              movie.posterUrl,
              width: 90,
              height: 130,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text("Year: ${movie.year}"),
                  Text(
                    movie.genres.join(", "),
                  ),
                  Text(
                    "Rating: ${movie.rating}",
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