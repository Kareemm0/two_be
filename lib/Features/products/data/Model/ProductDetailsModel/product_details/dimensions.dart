import 'package:equatable/equatable.dart';

class Dimensions extends Equatable {
  final String? length;
  final String? width;
  final String? height;

  const Dimensions({this.length, this.width, this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json['length'] as String?,
        width: json['width'] as String?,
        height: json['height'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'length': length,
        'width': width,
        'height': height,
      };

  @override
  List<Object?> get props => [length, width, height];
}
