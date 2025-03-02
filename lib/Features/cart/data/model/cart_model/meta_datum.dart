import 'package:equatable/equatable.dart';

class MetaDatum extends Equatable {
  final String? key;
  final String? value;

  const MetaDatum({this.key, this.value});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        key: json['key'] as String?,
        value: json['value'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };

  @override
  List<Object?> get props => [key, value];
}
