class User {
  late String lastName;
  late String firstName;
  late String username;
  late String email;

  User(this.lastName,this.firstName,this.username,this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['lastName'] as String,
        json['firstName'] as String,
        json['username'] as String,
        json['email'] as String
    );

  }
}