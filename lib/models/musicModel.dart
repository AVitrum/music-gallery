class MusicModel {
  String title;
  String img;
  String description;
  String link;
  int year;

  MusicModel(
      {required this.title,
      required this.img,
      required this.description,
      required this.link,
      required this.year});

  factory MusicModel.fromMap(Map<String, dynamic> map) => MusicModel(
        title: map['title'],
        img: map['img'],
        description: map['description'],
        link: map['link'],
        year: map['year'],
      );

  Map<String, dynamic> toMap() => {
        'img': img,
        'title': title,
        'description': description,
        'link': link,
        'year': year,
      };
}
