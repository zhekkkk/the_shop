import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_shop/models/badge.dart';
import 'package:decimal/decimal.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {

  const factory Product({
    required int id,
    required String picture,
    required List<Badge> badges,
    required Decimal price,
    @JsonKey(name: 'old_price') Decimal? oldPrice,
    required String name,
    String? article,
    double? rating,
    @JsonKey(name: 'reviews_count') int? reviewsCount,
    @JsonKey(name: 'city_fias') String? cityFias,
    String? brand,

  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

}