import 'package:equatable/equatable.dart';

class BannersModel extends Equatable {
  final String? title;
  final String? thumbnailUrl;

  const BannersModel({this.title, this.thumbnailUrl});

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        title: json['title'] as String?,
        thumbnailUrl: json['thumbnail_url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'thumbnail_url': thumbnailUrl,
      };

  @override
  List<Object?> get props => [title, thumbnailUrl];
}
