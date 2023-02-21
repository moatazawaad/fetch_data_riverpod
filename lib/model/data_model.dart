class DataModel {
  int? id, userId;
  String? title, body;

  DataModel({this.id, this.userId, this.title, this.body});

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      id: map['id'] as int,
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
