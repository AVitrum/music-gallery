import 'package:flutter/material.dart';
import 'package:gallery_app/api/musicBackend.dart';
import 'package:gallery_app/models/artistInfo.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtistDetailsView extends StatefulWidget {
  final ArtistInfo artist;

  const ArtistDetailsView({Key? key, required this.artist}) : super(key: key);

  @override
  _ArtistDetailsViewState createState() => _ArtistDetailsViewState();
}

class _ArtistDetailsViewState extends State<ArtistDetailsView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.artist.img),
                  radius: 40,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.artist.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      widget.artist.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                StreamBuilder<List<String>>(
                    stream: MusicBackend().favouriteArtists,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      final favoritedPainters = snapshot.data;
                      final isFavorited =
                          favoritedPainters!.contains(widget.artist.title);
                      return IconButton(
                        onPressed: () {
                          MusicBackend().setFavouritedArtist(
                            title: widget.artist.title,
                            favorited: !isFavorited,
                          );
                        },
                        iconSize: 30,
                        icon: Icon(isFavorited
                            ? Icons.favorite
                            : Icons.favorite_border),
                        color: Colors.red,
                      );
                    }),
                IconButton(
                  onPressed: () {
                    launch(widget.artist.link);
                  },
                  iconSize: 30,
                  icon: Icon(Icons.link),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
