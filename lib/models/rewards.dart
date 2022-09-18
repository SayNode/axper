class Reward {
  String title;
  String description;
  String image;
  int cost;
  String sellerAddress;


  Reward(
    this.title,
    this.description,
    this.image,
    this.cost,
    this.sellerAddress
  );

  static Reward fromJson(Map<String, dynamic> json) => Reward(
        json['title'] as String,
        json['description'] as String,
        json['image'] as String,
        json['cost'] as int,
        json['seller_address'] as String,
      );

  static Map<String, dynamic> toJson(Reward instance) => <String, dynamic>{
        'title': instance.title,
        'description': instance.description,
        'image': instance.image,
        'cost': instance.cost,
        'seller_address': instance.sellerAddress,
      };
}
