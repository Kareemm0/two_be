import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final int? id;
  final String? dateCreated;
  final String? dateCreatedGmt;
  final String? dateModified;
  final String? dateModifiedGmt;
  final String? src;
  final String? name;
  final String? alt;

  const Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as int?,
        dateCreated: json['date_created'] as String?,
        dateCreatedGmt: json['date_created_gmt'] as String?,
        dateModified: json['date_modified'] as String?,
        dateModifiedGmt: json['date_modified_gmt'] as String?,
        src: json['src'] as String?,
        name: json['name'] as String?,
        alt: json['alt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date_created': dateCreated,
        'date_created_gmt': dateCreatedGmt,
        'date_modified': dateModified,
        'date_modified_gmt': dateModifiedGmt,
        'src': src,
        'name': name,
        'alt': alt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      dateCreated,
      dateCreatedGmt,
      dateModified,
      dateModifiedGmt,
      src,
      name,
      alt,
    ];
  }
}
