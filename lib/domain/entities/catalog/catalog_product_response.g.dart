// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CatalogProductResponse _$$_CatalogProductResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CatalogProductResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$_CatalogProductResponseToJson(
        _$_CatalogProductResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'count': instance.count,
      'next': instance.next,
    };
