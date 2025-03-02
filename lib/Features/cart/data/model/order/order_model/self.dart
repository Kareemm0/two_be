import 'package:equatable/equatable.dart';

class Self extends Equatable {
  final String? href;

  const Self({this.href});

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };

  @override
  List<Object?> get props => [href];
}
