import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

Payment createMockPayload({
  required String amount,
  required String email,
  required String phone,
  required Currency currency,
  required String name,
  required String city,
  required String address,
  required String ordertitle,
  required int quantity,
}) {
  return Payment(
    amount: amount,
    currency: currency,
    buyer: Buyer(
      email: email,
      phone: phone,
      name: name,
    ),
    buyerHistory: BuyerHistory(
      loyaltyLevel: 0,
      registeredSince: '2019-08-24T14:15:22Z',
      wishlistCount: 0,
      isEmailVerified: true,
      isPhoneNumberVerified: true,
      isSocialNetworksConnected: true,
    ),
    shippingAddress: ShippingAddress(
      city: city,
      address: address,
      zip: '',
    ),
    order: Order(
      referenceId: '',
      items: [
        OrderItem(
          title: ordertitle,
          quantity: quantity,
          unitPrice: '',
          category: '',
        )
      ],
    ),
    orderHistory: [
      OrderHistoryItem(
        purchasedAt: '',
        amount: '',
        paymentMethod: OrderHistoryItemPaymentMethod.card,
        status: OrderHistoryItemStatus.newOne,
      )
    ],
  );
}
