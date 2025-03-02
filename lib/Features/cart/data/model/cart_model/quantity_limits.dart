import 'package:equatable/equatable.dart';

class QuantityLimits extends Equatable {
  final int? minimum;
  final int? maximum;
  final int? multipleOf;
  final bool? editable;

  const QuantityLimits({
    this.minimum,
    this.maximum,
    this.multipleOf,
    this.editable,
  });

  factory QuantityLimits.fromJson(Map<String, dynamic> json) {
    return QuantityLimits(
      minimum: json['minimum'] as int?,
      maximum: json['maximum'] as int?,
      multipleOf: json['multiple_of'] as int?,
      editable: json['editable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'minimum': minimum,
        'maximum': maximum,
        'multiple_of': multipleOf,
        'editable': editable,
      };

  @override
  List<Object?> get props => [minimum, maximum, multipleOf, editable];
}
