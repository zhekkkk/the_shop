import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_shop/domain/entities/catalog/catalog_product_response.dart';

part 'catalog_service.g.dart';

@RestApi()
abstract class CatalogService {

  factory CatalogService(Dio dio, {String baseUrl}) = _CatalogService;

  @POST('/catalog/products/')
  Future<CatalogProductResponse> postProducts();

}