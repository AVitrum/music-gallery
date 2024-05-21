import 'package:flutter/material.dart';
import 'package:gallery_app/models/artistInfo.dart';
import 'package:gallery_app/views/components/artist_details_view.dart';
import 'package:gallery_app/views/components/music_view.dart';

class ArtistsListView extends StatefulWidget {
  final List<ArtistInfo> artists;
  const ArtistsListView({super.key, required this.artists});

  @override
  State<ArtistsListView> createState() => _ArtistsListViewState();
}

class _ArtistsListViewState extends State<ArtistsListView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 70 / 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/background_img/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                  //color: Colors.grey,
                ),
                child: ListView.builder(
                  itemCount: widget.artists.length,
                  itemBuilder: (context, index) {
                    print(widget.artists[index]);
                    return GestureDetector(
                      onTap: () {
                        debugPrint(widget.artists[index].title);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MusicView(artist: widget.artists[index]);
                            },
                          ),
                        );
                      },
                      child: ArtistDetailsView(artist: widget.artists[index]),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
