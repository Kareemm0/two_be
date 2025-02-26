import 'package:equatable/equatable.dart';

import 'image.dart';
import 'links.dart';

class CategoryModel extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final int? parent;
  final String? description;
  final String? display;
  final Image? image;
  final int? menuOrder;
  final int? count;
  final Links? links;

  const CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.links,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        parent: json['parent'] as int?,
        description: json['description'] as String?,
        display: json['display'] as String?,
        image: json['image'] == null
            ? null
            : Image.fromJson(json['image'] as Map<String, dynamic>),
        menuOrder: json['menu_order'] as int?,
        count: json['count'] as int?,
        links: json['_links'] == null
            ? null
            : Links.fromJson(json['_links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'parent': parent,
        'description': description,
        'display': display,
        'image': image?.toJson(),
        'menu_order': menuOrder,
        'count': count,
        '_links': links?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      parent,
      description,
      display,
      image,
      menuOrder,
      count,
      links,
    ];
  }
}
