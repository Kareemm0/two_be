import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final String? message;
  final List<int>? favorites;

  const FavoriteModel({this.message, this.favorites});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        message: json['message'] as String?,
        favorites: json['favorites'] as List<int>?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'favorites': favorites,
      };

  @override
  List<Object?> get props => [message, favorites];
}
