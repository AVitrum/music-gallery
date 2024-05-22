import 'package:flutter/material.dart';
import 'package:gallery_app/api/musicBackend.dart';
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
                StreamBuilder<int>(
                  stream: MusicBackend().getLikesForMusic(music.title),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final likes = snapshot.data!;
                      return Text(
                        'Likes: $likes',
                        style: const TextStyle(fontSize: 16),
                      );
                    } else {
                      return Text(
                        'Likes: Loading...',
                        style: const TextStyle(fontSize: 16),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
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
                StreamBuilder<List<String>>(
                  stream: MusicBackend().favouriteMusics,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final favoritedMusics = snapshot.data;
                    final isFavorited = favoritedMusics!.contains(music.title);
                    return IconButton(
                      onPressed: () {
                        MusicBackend().setFavouritedMusic(
                          title: music.title,
                          favorited: !isFavorited,
                        );
                      },
                      iconSize: 30,
                      icon: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border),
                      color: Color(0xff1fd00f),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
