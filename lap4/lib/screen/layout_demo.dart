import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> movies = [
      "Avengers",
      "Iron Man",
      "Batman",
      "Spider Man",
      "Superman",
      "Frozen",
      "Toy Story",
      "Titanic",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Layout Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            const Text(
              "Popular Movies",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,

                itemBuilder:
                    (context, index) {

                  return Card(
                    child: ListTile(
                      leading:
                      const Icon(Icons.movie),
                      title: Text(
                        movies[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}