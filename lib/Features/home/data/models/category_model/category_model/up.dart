import 'package:equatable/equatable.dart';

class Up extends Equatable {
  final String? href;

  const Up({this.href});

  factory Up.fromJson(Map<String, dynamic> json) => Up(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
      };

  @override
  List<Object?> get props => [href];
}
