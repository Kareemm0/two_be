import 'package:equatable/equatable.dart';

class CountriesModel with EquatableMixin {
  final int? id;
  final String? name;
  final String? flag;

  const CountriesModel({this.id, this.name, this.flag});

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      flag: json['flag'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, flag];
}
