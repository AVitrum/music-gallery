class FactModel {
  String img;
  String description;
  String title;

  FactModel(
      {required this.img, required this.description, required this.title});

  factory FactModel.fromMap(Map<String, dynamic> map) => FactModel(
      img: map['img'], description: map['description'], title: map['title']);

  Map<String, dynamic> toMap() =>
      {'img': img, 'description': description, 'title': title};
}
