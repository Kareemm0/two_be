import 'package:equatable/equatable.dart';

class RawPrices extends Equatable {
  final int? precision;
  final String? price;
  final String? regularPrice;
  final String? salePrice;

  const RawPrices({
    this.precision,
    this.price,
    this.regularPrice,
    this.salePrice,
  });

  factory RawPrices.fromJson(Map<String, dynamic> json) => RawPrices(
        precision: json['precision'] as int?,
        price: json['price'] as String?,
        regularPrice: json['regular_price'] as String?,
        salePrice: json['sale_price'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'precision': precision,
        'price': price,
        'regular_price': regularPrice,
        'sale_price': salePrice,
      };

  @override
  List<Object?> get props => [precision, price, regularPrice, salePrice];
}
