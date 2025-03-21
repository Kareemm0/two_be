import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final String consumerKey = "ck_8594640c33d27b155100fada7edd797c2803aa58";
final String consumerSecret = "cs_21b7d8d14e33732db7205606af575ac5eb2d8458";
final String consumerKeyValue = "consumer_key";
final String consumerSecretValue = "consumer_secret";
final String perPage = "per_page";
final String ftoorhApiKey =
    "qLEtNt3Kr7oEpba6KlR5g6zyZWwLqiOc-dbx4ssct371ivayfXiCxJd507fTINUHNkI7JB-_qzh6oqAJRImvYu5LD8FBsSjnXrPhqQiznkEgOOks0lY6OTQJhwp5GL70R-xAkhzZbMrTgeT_VZqB2P6MXKwwwbaemcCyYscxdhnrHJbP_DHQiZWfB_UIv_1Mf7nm6aAf-yj3EFuxNPV3B41r37VKm6TxBmHe4jCqRSAA_YGfA-ySllZ1gmCDy8K6qBAYxq1fTndHl-UXKTXc6xhZOrgvGyOTdWq-omFfLnsAwWTUQ8cHgJQW4Zzv89lpR5TTM0jFCyLnzoy4o2wv-Efx5JDyk34z2wJnP7gWqZ1UQd10-zKWAMTf6XWoLaLvBZxyK2j6RWwwYk8vyc0TLe-w8_oBK9fDy0FTGab-8G7r6ZuBKlypMCJaGKvprHWM6dkpxKdqWwkBts-NOBaGPtpo5NrsBE5NdpbaSqvYFmwopPFyOxqfKKXvexK9acqQi7MwRs9B5wqfmScBAoRSkYcZZvWLJTMFl-a_ug-o-HH5MXKvn9MAKc0Jl6tourQ7UvP-WM82S9XwNrjBCOUQFAnaZVQY-aR3gJfLj7Cr2zooRT4jPDIxEnRsaGYVGQt09JcMRi531AmDW01DR2v7K2f4WdquV7p0E2WqqV-1MN9sMj4155XIqvyTjBfIQyxv-Q9LtARzP1umiFAkczZx01Leq8g";



/*
{
  "payment_method": "cod",
  "payment_method_title": "Cash on Delivery",
  "set_paid": false,
  "billing": {
    "first_name": "Ahmed",
    "last_name": "Elgamal",
    "address_1": "شارع ١٢٣",
    "city": "Cairo",
    "state": "Cairo",
    "postcode": "12345",
    "country": "EG",
    "email": "ahmedelgmal763@gmail.com",
    "phone": "01144745671"
  },
  "shipping": {
    "first_name": "Ahmed",
    "last_name": "Elgamal",
    "address_1": "شارع ١٢٣",
    "city": "Cairo",
    "state": "Cairo",
    "postcode": "12345",
    "country": "EG"
  },
  "line_items": [
    {
      "product_id": 1234,
      "quantity": 2
    },
    {
      "product_id": 5678,
      "quantity": 1
    }
  ],
  "shipping_lines": [
    {
      "method_id": "flat_rate",
      "method_title": "Flat Rate",
      "total": "10.00"
    }
  ]
}


 */