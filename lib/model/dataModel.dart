


class DataModel {
  int ?id;
  int? userId;
  String? title;
  String? body;

  DataModel({this.id, this.userId, this.body, this.title});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userID'];
    body = json['body'];
    title = json['title'];
  }

}
