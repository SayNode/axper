class Request {
  final String title;
  final String description;
  final String username;
  final String user_pk;
  String status;
  final int amount;
  final int id;

  Request(this.title, this.description, this.username, this.user_pk,
      this.status, this.amount, this.id);

  static Request fromJson(Map<String, dynamic> json) => Request(
      json['title'] as String,
      json['description'] as String,
      json['username'] as String,
      json['user_pk'] as String,
      json['status'] as String,
      json['amount'] as int,
      json['id'] as int);

  static Map<String, dynamic> toJson(Request instance) => <String, dynamic>{
        'title': instance.title,
        'description': instance.description,
        'username': instance.username,
        'user_pk': instance.user_pk,
        'status': instance.status,
        'amount': instance.amount,
        'id': instance.id,
      };
}
