import 'package:equatable/equatable.dart';

import 'collection.dart';
import 'self.dart';

class Links extends Equatable {
  final List<Self>? self;
  final List<Collection>? collection;

  const Links({this.self, this.collection});

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: (json['self'] as List<dynamic>?)
            ?.map((e) => Self.fromJson(e as Map<String, dynamic>))
            .toList(),
        collection: (json['collection'] as List<dynamic>?)
            ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'self': self?.map((e) => e.toJson()).toList(),
        'collection': collection?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [self, collection];
}
