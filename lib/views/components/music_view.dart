import 'package:flutter/material.dart';
import 'package:gallery_app/models/artistInfo.dart';
import 'package:gallery_app/views/components/music_details.dart';

class MusicView extends StatelessWidget {
  final ArtistInfo artist;

  const MusicView({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background_img/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: artist.musicList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicDetailsPage(
                      music: artist.musicList[index],
                      title: artist.title,
                    ),
                  ),
                );
              },
              child: Center(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      artist.musicList[index].img,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Center(
                          child: Text(
                            artist.musicList[index].title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
