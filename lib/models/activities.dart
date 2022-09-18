class Activites {
  String title;
  String subtitle;
  String description;
  String image;
  int group;

  Activites(
      this.title, this.subtitle, this.description, this.image, this.group);

  static Activites fromJson(Map<String, dynamic> json) => Activites(
        json['title'].toString(),
        json['subtitle'] as String,
        json['description'] as String,
        json['image'] as String,
        json['group'] as int,
      );

  static Map<String, dynamic> toJson(Activites instance) => <String, dynamic>{
        'title': instance.title,
        'subtitle': instance.subtitle,
        'description': instance.description,
        'image': instance.image,
        'group': instance.group,
      };
}
