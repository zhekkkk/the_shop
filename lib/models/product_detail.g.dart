// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDetail _$$_ProductDetailFromJson(Map<String, dynamic> json) =>
    _$_ProductDetail(
      id: json['id'] as int,
      price: Decimal.fromJson(json['price'] as String),
      badges: (json['badges'] as List<dynamic>)
          .map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      brand: json['brand'] as String?,
      picture: json['picture'] as String?,
      article: json['article'] as String?,
      description: json['description'] as String?,
      available: json['available'] as bool?,
      rating: (json['rating'] as num?)?.toDouble(),
      oldPrice: json['old_price'] == null
          ? null
          : Decimal.fromJson(json['old_price'] as String),
      reviewsCount: json['reviews_count'] as int?,
      cityFias: json['city_fias'] as String?,
    );

Map<String, dynamic> _$$_ProductDetailToJson(_$_ProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'badges': instance.badges,
      'name': instance.name,
      'brand': instance.brand,
      'picture': instance.picture,
      'article': instance.article,
      'description': instance.description,
      'available': instance.available,
      'rating': instance.rating,
      'old_price': instance.oldPrice,
      'reviews_count': instance.reviewsCount,
      'city_fias': instance.cityFias,
    };
