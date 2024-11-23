import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {
      'title': 'Rendang',
      'image': 'https://img.freepik.com/free-photo/front-view-cooked-vegetable-meal-including-vegetables-meat-inside-brown-desk_140725-61544.jpg?ga=GA1.1.2064976088.1693325150&semt=ais_hybrid',
      'description': 'Deskripsi resep 1',
    },
    {
      'title': 'Ayam Rica-Rica',
      'image': 'https://img.freepik.com/free-photo/front-view-cooked-vegetable-meal-including-vegetables-meat-inside-brown-desk_140725-61544.jpg?ga=GA1.1.2064976088.1693325150&semt=ais_hybrid',
      'description': 'Deskripsi resep 2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Favorit Resep"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(recipes[index]['image']!),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    recipes[index]['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(recipes[index]['description']!),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}