import 'package:equatable/equatable.dart';

class Destination extends Equatable {
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;

  const Destination({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        address1: json['address_1'] as String?,
        address2: json['address_2'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        postcode: json['postcode'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'address_1': address1,
        'address_2': address2,
        'city': city,
        'state': state,
        'postcode': postcode,
        'country': country,
      };

  @override
  List<Object?> get props {
    return [
      address1,
      address2,
      city,
      state,
      postcode,
      country,
    ];
  }
}
