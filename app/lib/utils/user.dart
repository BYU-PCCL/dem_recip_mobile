class User {
  String username;
  String firstName;
  String lastName;

  User({required this.username, required this.firstName, required this.lastName});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
