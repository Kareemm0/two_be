import 'package:equatable/equatable.dart';

class Totals extends Equatable {
  final String? lineSubtotal;
  final String? lineSubtotalTax;
  final String? lineTotal;
  final String? lineTotalTax;
  final String? currencyCode;
  final String? currencySymbol;
  final int? currencyMinorUnit;
  final String? currencyDecimalSeparator;
  final String? currencyThousandSeparator;
  final String? currencyPrefix;
  final String? currencySuffix;

  const Totals({
    this.lineSubtotal,
    this.lineSubtotalTax,
    this.lineTotal,
    this.lineTotalTax,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
        lineSubtotal: json['line_subtotal'] as String?,
        lineSubtotalTax: json['line_subtotal_tax'] as String?,
        lineTotal: json['line_total'] as String?,
        lineTotalTax: json['line_total_tax'] as String?,
        currencyCode: json['currency_code'] as String?,
        currencySymbol: json['currency_symbol'] as String?,
        currencyMinorUnit: json['currency_minor_unit'] as int?,
        currencyDecimalSeparator: json['currency_decimal_separator'] as String?,
        currencyThousandSeparator:
            json['currency_thousand_separator'] as String?,
        currencyPrefix: json['currency_prefix'] as String?,
        currencySuffix: json['currency_suffix'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'line_subtotal': lineSubtotal,
        'line_subtotal_tax': lineSubtotalTax,
        'line_total': lineTotal,
        'line_total_tax': lineTotalTax,
        'currency_code': currencyCode,
        'currency_symbol': currencySymbol,
        'currency_minor_unit': currencyMinorUnit,
        'currency_decimal_separator': currencyDecimalSeparator,
        'currency_thousand_separator': currencyThousandSeparator,
        'currency_prefix': currencyPrefix,
        'currency_suffix': currencySuffix,
      };

  @override
  List<Object?> get props {
    return [
      lineSubtotal,
      lineSubtotalTax,
      lineTotal,
      lineTotalTax,
      currencyCode,
      currencySymbol,
      currencyMinorUnit,
      currencyDecimalSeparator,
      currencyThousandSeparator,
      currencyPrefix,
      currencySuffix,
    ];
  }
}
