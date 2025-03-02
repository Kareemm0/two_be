import 'package:equatable/equatable.dart';

class WtScBlocks extends Equatable {
  final String? couponCode;
  final String? couponMessage;
  final String? cartitemGiveawayText;
  final String? giveawayProductsHtml;
  final List<dynamic>? appliedAutoCouponList;

  const WtScBlocks({
    this.couponCode,
    this.couponMessage,
    this.cartitemGiveawayText,
    this.giveawayProductsHtml,
    this.appliedAutoCouponList,
  });

  factory WtScBlocks.fromJson(Map<String, dynamic> json) => WtScBlocks(
        couponCode: json['coupon_code'] as String?,
        couponMessage: json['coupon_message'] as String?,
        cartitemGiveawayText: json['cartitem_giveaway_text'] as String?,
        giveawayProductsHtml: json['giveaway_products_html'] as String?,
        appliedAutoCouponList:
            json['applied_auto_coupon_list'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'coupon_code': couponCode,
        'coupon_message': couponMessage,
        'cartitem_giveaway_text': cartitemGiveawayText,
        'giveaway_products_html': giveawayProductsHtml,
        'applied_auto_coupon_list': appliedAutoCouponList,
      };

  @override
  List<Object?> get props {
    return [
      couponCode,
      couponMessage,
      cartitemGiveawayText,
      giveawayProductsHtml,
      appliedAutoCouponList,
    ];
  }
}
