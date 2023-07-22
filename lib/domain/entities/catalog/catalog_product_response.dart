import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_shop/models/product.dart';

part 'catalog_product_response.freezed.dart';
part 'catalog_product_response.g.dart';

@freezed
class CatalogProductResponse with _$CatalogProductResponse {
  factory CatalogProductResponse({
    required List<Product> results,
    required int count,
    required String? next,
}) = _CatalogProductResponse;

  factory CatalogProductResponse.fromJson(Map<String, dynamic> json) => _$CatalogProductResponseFromJson(json);
}