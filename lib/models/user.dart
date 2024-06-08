class UserModel {
  String name;
  String email;
  String password;
  String dateOfBirth;
  String phoneNumber;
  String gender;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.gender,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      password: '',
      dateOfBirth: map['dateOfBirth'],
      phoneNumber: map['phoneNumber'],
      gender: map['gender'],
    );
  }
}

class UserModelLogin {
  final String uid;
  final String email;

  UserModelLogin({required this.uid, required this.email});
}
