import 'package:flutter/material.dart';
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
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  iconSize: 30,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
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
