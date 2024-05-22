import 'package:gallery_app/models/musicModel.dart';

class ArtistInfo {
  ArtistInfo({
    required this.id,
    required this.title,
    required this.img,
    required this.description,
    required this.lat,
    required this.lng,
    required this.link,
    required this.musicList,
  });

  factory ArtistInfo.fromMap(Map<String, dynamic> map) => ArtistInfo(
        id: map['id'],
        title: map['title'],
        img: map['img'],
        description: map['description'],
        lat: map['lat'],
        lng: map['lng'],
        link: map['link'],
        musicList: List<MusicModel>.from(
            map['musicList'].map((e) => MusicModel.fromMap(e))),
      );

  int id;
  String title;
  String img;
  String description;
  double lat;
  double lng;
  String link;
  List<MusicModel> musicList;

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'img': img,
        'description': description,
        'lat': lat,
        'lng': lng,
        'link': link,
        'musicList': musicList.map((e) => e.toMap()).toList(),
      };
}
