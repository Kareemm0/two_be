import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  final int? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? token;
  final String? message;

  const User({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.avatar,
    this.token,
    this.message,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        avatar: json['avatar'] as String?,
        token: json['token'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'phone': phone,
        'avatar': avatar,
        'token': token,
        'message': message,
      };

  @override
  List<Object?> get props {
    return [
      id,
      username,
      email,
      phone,
      avatar,
      token,
      message,
    ];
  }
}
