class User {
  String uid;
  String email;
  String name;

  User({this.uid, this.email, this.name});

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['name'] = user.name;
  }

  User.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.email = mapData['email'];
    this.name = mapData['name'];
  }
}
