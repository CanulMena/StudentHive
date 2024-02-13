class User {
  //*UserId - No lo manaremos por que la base de datas será identity y se agregaré de manera automatica
  final String userAge;
  final String email;
  final String password;
  final String name;
  final String lastName;
  final String? description;
  final int? phoneNumber;
  final String? url;
  final String? gender;

  User(
      {required this.userAge,
      required this.email,
      required this.password,
      required this.name,
      required this.lastName,
      this.description,
      this.phoneNumber,
      this.url,
      this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userAge: json['userAge'],
        email: json['email'],
        password: json['password'],
        name: json['name'],
        lastName: json['lastName'],
        description: json['description'],
        phoneNumber: json['phoneNumber'],
        url: json['url'],
        gender: json['gender']
        );
  }
  Map<String, dynamic> toJson() {
  return {
    'userAge' : userAge,
    'email': email,
    'password' : password,
    'name': name,
    'lastName' : lastName,
    'description' : description,
    'phoneNumber': phoneNumber,
    'url' : url,
    'gender' : gender
    
  };
}
}
