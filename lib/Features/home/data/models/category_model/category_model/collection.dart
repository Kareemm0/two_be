import 'package:equatable/equatable.dart';

class Collection extends Equatable {
  final String? href;

  const Collection({this.href});

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };

  @override
  List<Object?> get props => [href];
}
