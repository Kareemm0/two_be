import 'package:equatable/equatable.dart';
import 'image.dart';
import 'prices.dart';
import 'quantity_limits.dart';
import 'totals.dart';

class Item extends Equatable {
  final String? key;
  final int? id;
  final String? type;
  final int? quantity;
  final QuantityLimits? quantityLimits;
  final String? name;
  final String? shortDescription;
  final String? description;
  final String? sku;
  final dynamic lowStockRemaining;
  final bool? backordersAllowed;
  final bool? showBackorderBadge;
  final bool? soldIndividually;
  final String? permalink;
  final List<Image>? images;
  final List<dynamic>? variation;
  final List<dynamic>? itemData;
  final Prices? prices;
  final Totals? totals;
  final String? catalogVisibility;
  // final Extensions? extensions;

  const Item({
    this.key,
    this.id,
    this.type,
    this.quantity,
    this.quantityLimits,
    this.name,
    this.shortDescription,
    this.description,
    this.sku,
    this.lowStockRemaining,
    this.backordersAllowed,
    this.showBackorderBadge,
    this.soldIndividually,
    this.permalink,
    this.images,
    this.variation,
    this.itemData,
    this.prices,
    this.totals,
    this.catalogVisibility,
    //this.extensions,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        key: json['key'] as String?,
        id: json['id'] as int?,
        type: json['type'] as String?,
        quantity: json['quantity'] as int?,
        quantityLimits: json['quantity_limits'] == null
            ? null
            : QuantityLimits.fromJson(
                json['quantity_limits'] as Map<String, dynamic>),
        name: json['name'] as String?,
        shortDescription: json['short_description'] as String?,
        description: json['description'] as String?,
        sku: json['sku'] as String?,
        lowStockRemaining: json['low_stock_remaining'] as dynamic,
        backordersAllowed: json['backorders_allowed'] as bool?,
        showBackorderBadge: json['show_backorder_badge'] as bool?,
        soldIndividually: json['sold_individually'] as bool?,
        permalink: json['permalink'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        variation: json['variation'] as List<dynamic>?,
        itemData: json['item_data'] as List<dynamic>?,
        prices: json['prices'] == null
            ? null
            : Prices.fromJson(json['prices'] as Map<String, dynamic>),
        totals: json['totals'] == null
            ? null
            : Totals.fromJson(json['totals'] as Map<String, dynamic>),
        catalogVisibility: json['catalog_visibility'] as String?,
        // extensions: json['extensions'] == null
        //     ? null
        //     : Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'key': key,
        'id': id,
        'type': type,
        'quantity': quantity,
        'quantity_limits': quantityLimits?.toJson(),
        'name': name,
        'short_description': shortDescription,
        'description': description,
        'sku': sku,
        'low_stock_remaining': lowStockRemaining,
        'backorders_allowed': backordersAllowed,
        'show_backorder_badge': showBackorderBadge,
        'sold_individually': soldIndividually,
        'permalink': permalink,
        'images': images?.map((e) => e.toJson()).toList(),
        'variation': variation,
        'item_data': itemData,
        'prices': prices?.toJson(),
        'totals': totals?.toJson(),
        'catalog_visibility': catalogVisibility,
        // 'extensions': extensions?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      key,
      id,
      type,
      quantity,
      quantityLimits,
      name,
      shortDescription,
      description,
      sku,
      lowStockRemaining,
      backordersAllowed,
      showBackorderBadge,
      soldIndividually,
      permalink,
      images,
      variation,
      itemData,
      prices,
      totals,
      catalogVisibility,
      //  extensions,
    ];
  }
}
