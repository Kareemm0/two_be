import 'package:equatable/equatable.dart';

import 'raw_prices.dart';

class Prices extends Equatable {
  final String? price;
  final String? regularPrice;
  final String? salePrice;
  final dynamic priceRange;
  final String? currencyCode;
  final String? currencySymbol;
  final int? currencyMinorUnit;
  final String? currencyDecimalSeparator;
  final String? currencyThousandSeparator;
  final String? currencyPrefix;
  final String? currencySuffix;
  final RawPrices? rawPrices;

  const Prices({
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceRange,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
    this.rawPrices,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        price: json['price'] as String?,
        regularPrice: json['regular_price'] as String?,
        salePrice: json['sale_price'] as String?,
        priceRange: json['price_range'] as dynamic,
        currencyCode: json['currency_code'] as String?,
        currencySymbol: json['currency_symbol'] as String?,
        currencyMinorUnit: json['currency_minor_unit'] as int?,
        currencyDecimalSeparator: json['currency_decimal_separator'] as String?,
        currencyThousandSeparator:
            json['currency_thousand_separator'] as String?,
        currencyPrefix: json['currency_prefix'] as String?,
        currencySuffix: json['currency_suffix'] as String?,
        rawPrices: json['raw_prices'] == null
            ? null
            : RawPrices.fromJson(json['raw_prices'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'price': price,
        'regular_price': regularPrice,
        'sale_price': salePrice,
        'price_range': priceRange,
        'currency_code': currencyCode,
        'currency_symbol': currencySymbol,
        'currency_minor_unit': currencyMinorUnit,
        'currency_decimal_separator': currencyDecimalSeparator,
        'currency_thousand_separator': currencyThousandSeparator,
        'currency_prefix': currencyPrefix,
        'currency_suffix': currencySuffix,
        'raw_prices': rawPrices?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      price,
      regularPrice,
      salePrice,
      priceRange,
      currencyCode,
      currencySymbol,
      currencyMinorUnit,
      currencyDecimalSeparator,
      currencyThousandSeparator,
      currencyPrefix,
      currencySuffix,
      rawPrices,
    ];
  }
}
