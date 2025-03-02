import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  final String? title;
  final String? content;
  final String? date;

  const NotificationModel({this.title, this.content, this.date});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json['title'] as String?,
        content: json['content'] as String?,
        date: json['date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'date': date,
      };

  @override
  List<Object?> get props => [title, content, date];
}
