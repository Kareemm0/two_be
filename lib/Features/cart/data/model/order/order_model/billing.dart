import 'package:equatable/equatable.dart';

class Billing extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? company;
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? postcode;
  final String? country;
  final String? email;
  final String? phone;

  const Billing({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        company: json['company'] as String?,
        address1: json['address_1'] as String?,
        address2: json['address_2'] as String?,
        city: json['city'] as String?,
        state: json['state'] as String?,
        postcode: json['postcode'] as String?,
        country: json['country'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'company': company,
        'address_1': address1,
        'address_2': address2,
        'city': city,
        'state': state,
        'postcode': postcode,
        'country': country,
        'email': email,
        'phone': phone,
      };

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      company,
      address1,
      address2,
      city,
      state,
      postcode,
      country,
      email,
      phone,
    ];
  }
}
