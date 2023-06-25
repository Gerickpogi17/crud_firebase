class User {
  final String name;
  final String email;
  final int age;

  const User({required this.name, required this.email, required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      age: json['age'] as int, // Cast the value to double
    );
  }
}
