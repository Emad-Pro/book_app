import 'package:equatable/equatable.dart';

import 'item.dart';

class BookModel extends Equatable {
  final List<Item>? items;
  const BookModel({this.items});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props => [items];
}
