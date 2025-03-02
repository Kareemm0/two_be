import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final int? id;
  final String? src;
  final String? thumbnail;
  final String? srcset;
  final String? sizes;
  final String? name;
  final String? alt;

  const Image({
    this.id,
    this.src,
    this.thumbnail,
    this.srcset,
    this.sizes,
    this.name,
    this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as int?,
        src: json['src'] as String?,
        thumbnail: json['thumbnail'] as String?,
        srcset: json['srcset'] as String?,
        sizes: json['sizes'] as String?,
        name: json['name'] as String?,
        alt: json['alt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'src': src,
        'thumbnail': thumbnail,
        'srcset': srcset,
        'sizes': sizes,
        'name': name,
        'alt': alt,
      };

  @override
  List<Object?> get props {
    return [
      id,
      src,
      thumbnail,
      srcset,
      sizes,
      name,
      alt,
    ];
  }
}
