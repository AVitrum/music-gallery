import 'package:flutter/material.dart';
import 'package:gallery_app/api/musicBackend.dart';
import 'package:gallery_app/views/components/gallery_view.dart';


class MusicGallery extends StatelessWidget {

  final backend = MusicBackend();

  MusicGallery({ super.key });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: backend.getArtists(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ArtistsListView(artists: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
