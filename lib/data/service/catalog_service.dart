import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_shop/domain/entities/catalog/catalog_product_response.dart';
import 'package:the_shop/models/product.dart';

part 'catalog_service.g.dart';

@RestApi()
abstract class CatalogService {

  factory CatalogService(Dio dio, {String baseUrl}) = _CatalogService;

  @POST('/catalog/products/')
  Future<CatalogProductResponse> postProducts();

  @GET('/catalog/product/')
  Future<Product> getProduct({
    @Query('product_id') int? productId
  });

}