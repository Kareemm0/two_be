import 'package:equatable/equatable.dart';

class MetaDatum extends Equatable {
  final int? id;
  final String? key;
  final dynamic value;

  const MetaDatum({this.id, this.key, this.value});

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json['id'] as int?,
        key: json['key'] as String?,
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'key': key,
        'value': value,
      };

  @override
  List<Object?> get props => [id, key, value];
}
