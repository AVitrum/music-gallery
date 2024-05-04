import 'package:gallery_app/models/musicModel.dart';

class ArtistInfo {

  int id;
  String title;
  String img;
  String description;
  String link;
  List<MusicModel> musicList;

  ArtistInfo({
    required this.id,
    required this.title,
    required this.img,
    required this.description,
    required this.link,
    required this.musicList,
  });

  factory ArtistInfo.fromMap(Map<String, dynamic> map) => ArtistInfo(
      id: map['id'],
      title: map['title'],
      img: map['img'],
      description: map['description'],
      link: map['link'],
      musicList: List<MusicModel>.from(map['musicList'].map((e) => MusicModel.fromMap(e))),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'img': img,
    'title': title,
    'description': description,
    'link': link,
    'musicList': musicList.map((e) => e.toMap()).toList(),
  };
}