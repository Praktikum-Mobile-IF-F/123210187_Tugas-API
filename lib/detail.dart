import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> character;

  DetailPage(this.character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (character['imageUrl'] != null)
              Image.network(
                character['imageUrl'],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 20),
            Text(
              'Films:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (character['films'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: character['films'].map<Widget>((film) {
                  return Text('- $film');
                }).toList(),
              ),
            SizedBox(height: 20),
            Text(
              'TV Shows:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (character['tvShows'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: character['tvShows'].map<Widget>((tvShow) {
                  return Text('- $tvShow');
                }).toList(),
              ),
            SizedBox(height: 20),
            Text(
              'Short Films:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (character['shortFilms'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: character['shortFilms'].map<Widget>((shortFilm) {
                  return Text('- $shortFilm');
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
