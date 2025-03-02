import 'package:equatable/equatable.dart';
import 'destination.dart';
import 'item.dart';

class ShippingRate extends Equatable {
  final int? packageId;
  final String? name;
  final Destination? destination;
  final List<Item>? items;
  final List<ShippingRate>? shippingRates;

  const ShippingRate({
    this.packageId,
    this.name,
    this.destination,
    this.items,
    this.shippingRates,
  });

  factory ShippingRate.fromJson(Map<String, dynamic> json) => ShippingRate(
        packageId: json['package_id'] as int?,
        name: json['name'] as String?,
        destination: json['destination'] == null
            ? null
            : Destination.fromJson(json['destination'] as Map<String, dynamic>),
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        shippingRates: (json['shipping_rates'] as List<dynamic>?)
            ?.map((e) => ShippingRate.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'package_id': packageId,
        'name': name,
        'destination': destination?.toJson(),
        'items': items?.map((e) => e.toJson()).toList(),
        'shipping_rates': shippingRates?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      packageId,
      name,
      destination,
      items,
      shippingRates,
    ];
  }
}
