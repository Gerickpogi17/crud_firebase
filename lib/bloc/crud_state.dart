part of 'crud_bloc.dart';

@immutable
class CrudState {
  final String name;
  final String email;
  final double age;
  final List<User> userList;

  const CrudState({
    required this.name,
    required this.email,
    required this.age,
    required this.userList
  });
  factory CrudState.empty() => const CrudState(
        name: '',
        email: '',
        age: 0,
        userList: []
      );
  CrudState copyWith({
    String? name,
    String? email,
    double? age,
    List<User>? userList
  }) {
    return CrudState(
        name: name ?? this.name,
        email: email ?? this.email,
        age: age ?? this.age,
        userList: userList ?? this.userList );
  }
}
