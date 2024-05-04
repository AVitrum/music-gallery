import 'package:flutter/material.dart';
import 'package:gallery_app/models/musicModel.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicDetailsPage extends StatelessWidget {
  final MusicModel music;
  final String title;

  const MusicDetailsPage({Key? key, required this.music, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            // додано Center для центрування по горизонталі
            child: Image.asset(
              music.img,
              fit: BoxFit.cover,
              height: 300,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              music.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  music.description,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  music.year.toString(),
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (music.link.isNotEmpty) {
                  launch(music.link);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No link'),
                    ),
                  );
                }
              },
              child: const Text('Listen'),
            ),
          ),
        ],
      ),
    );
  }
}
