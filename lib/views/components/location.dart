import 'package:flutter/material.dart';
import 'package:gallery_app/models/artistInfo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatelessWidget {
  final ArtistInfo artist;
  const Location({super.key, required this.artist});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.title),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(artist.lat, artist.lng),
          zoom: 11.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("MusicGalleryApp"),
            position: LatLng(artist.lat, artist.lng),
            infoWindow: InfoWindow(
              title: artist.title,
              snippet: "Venue of the upcoming concert",
            ),
          ), // Marker
        }, // markers
      ),
    );
  }
}
