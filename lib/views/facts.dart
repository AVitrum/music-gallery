import 'package:flutter/material.dart';
import 'package:gallery_app/api/musicBackend.dart';
import 'package:gallery_app/models/fact.dart';
import 'package:gallery_app/views/components/music_facts.dart';

class Facts extends StatelessWidget {
  final facts = MusicBackend();
  Facts({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: facts.getFacts(),
      builder: (context, AsyncSnapshot<List<FactModel>> snapshot) {
        if (snapshot.error != null) return Text(snapshot.error.toString());
        if (snapshot.connectionState == ConnectionState.done) {
          //print(snapshot.data?.length);
          return ArtExplore(facts: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
