import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final String imageUrl;

  const MovieCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    String truncatedTitle = title.length > 35
        ? '${title.substring(0, 35)}...'
        : title;

    String truncatedDescription = description.length > 100
        ? '${description.substring(0, 100)}...'
        : description;

    return SizedBox(
      height: 300.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncatedTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    truncatedDescription,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
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

class MovieCardList extends StatelessWidget {
  final List<Map<String, String>> movies;

  const MovieCardList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(movies.length, (index) {
            final movie = movies[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MovieCard(
                  title: movie['title']!,
                  description: movie['description']!,
                  duration: movie['duration']!,
                  imageUrl: movie['imageUrl']!,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
