import 'package:equatable/equatable.dart';
import 'billing_address.dart';
import 'item.dart';
import 'shipping_address.dart';
import 'shipping_rate.dart';
import 'totals.dart';

class CartModel extends Equatable {
  final List<Item>? items;
  final List<dynamic>? coupons;
  final List<dynamic>? fees;
  final Totals? totals;
  final ShippingAddress? shippingAddress;
  final BillingAddress? billingAddress;
  final bool? needsPayment;
  final bool? needsShipping;
  final List<dynamic>? paymentRequirements;
  final bool? hasCalculatedShipping;
  final List<ShippingRate>? shippingRates;
  final int? itemsCount;
  final int? itemsWeight;
  final List<dynamic>? crossSells;
  final List<dynamic>? errors;
  final List<dynamic>? paymentMethods;
  //final Extensions? extensions;

  const CartModel({
    this.items,
    this.coupons,
    this.fees,
    this.totals,
    this.shippingAddress,
    this.billingAddress,
    this.needsPayment,
    this.needsShipping,
    this.paymentRequirements,
    this.hasCalculatedShipping,
    this.shippingRates,
    this.itemsCount,
    this.itemsWeight,
    this.crossSells,
    this.errors,
    this.paymentMethods,
    //  this.extensions,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
        coupons: json['coupons'] as List<dynamic>?,
        fees: json['fees'] as List<dynamic>?,
        totals: json['totals'] == null
            ? null
            : Totals.fromJson(json['totals'] as Map<String, dynamic>),
        shippingAddress: json['shipping_address'] == null
            ? null
            : ShippingAddress.fromJson(
                json['shipping_address'] as Map<String, dynamic>),
        billingAddress: json['billing_address'] == null
            ? null
            : BillingAddress.fromJson(
                json['billing_address'] as Map<String, dynamic>),
        needsPayment: json['needs_payment'] as bool?,
        needsShipping: json['needs_shipping'] as bool?,
        paymentRequirements: json['payment_requirements'],
        hasCalculatedShipping: json['has_calculated_shipping'] as bool?,
        shippingRates: (json['shipping_rates'] as List<dynamic>?)
            ?.map((e) => ShippingRate.fromJson(e as Map<String, dynamic>))
            .toList(),
        itemsCount: json['items_count'] as int?,
        itemsWeight: json['items_weight'] as int?,
        crossSells: json['cross_sells'] as List<dynamic>?,
        errors: json['errors'] as List<dynamic>?,
        paymentMethods: json['payment_methods'],
        // extensions: json['extensions'] == null
        //     ? null
        //     : Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'coupons': coupons,
        'fees': fees,
        'totals': totals?.toJson(),
        'shipping_address': shippingAddress?.toJson(),
        'billing_address': billingAddress?.toJson(),
        'needs_payment': needsPayment,
        'needs_shipping': needsShipping,
        'payment_requirements': paymentRequirements,
        'has_calculated_shipping': hasCalculatedShipping,
        'shipping_rates': shippingRates?.map((e) => e.toJson()).toList(),
        'items_count': itemsCount,
        'items_weight': itemsWeight,
        'cross_sells': crossSells,
        'errors': errors,
        'payment_methods': paymentMethods,
        //  'extensions': extensions?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      items,
      coupons,
      fees,
      totals,
      shippingAddress,
      billingAddress,
      needsPayment,
      needsShipping,
      paymentRequirements,
      hasCalculatedShipping,
      shippingRates,
      itemsCount,
      itemsWeight,
      crossSells,
      errors,
      paymentMethods,
      // extensions,
    ];
  }
}
