class UserModel {
  String id, email, username, avatar;

  UserModel(this.id, this.email, this.username, this.avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'],
      json['email'],
      json['username'],
      json['avatar']
    );
  }
}