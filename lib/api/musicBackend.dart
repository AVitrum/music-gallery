import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gallery_app/models/artistInfo.dart';
import 'package:gallery_app/models/fact.dart';

class MusicBackend {
  Future<List<ArtistInfo>> getArtists() async {
    await Future.delayed(const Duration(microseconds: 1000));

    final String data = await rootBundle.loadString('assets/data/artists.json');
    final dataList = jsonDecode(data)['artists'] as List;

    return dataList.map((e) => ArtistInfo.fromMap(e)).toList();
  }

  Future<List<FactModel>> getFacts() async {
    await Future.delayed(const Duration(microseconds: 1000));

    final String data = await rootBundle.loadString('assets/data/facts.json');
    final dataList = jsonDecode(data)['facts'] as List;
    return dataList.map((e) => FactModel.fromMap(e)).toList();
  }
}
