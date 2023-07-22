import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:the_shop/data/service/catalog_service.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Dio()
            ..interceptors.add(
              PrettyDioLogger(),
            )
            ..options.baseUrl = 'https://farm.fbtw.ru',
        ),
        Provider(
          create: (context) => CatalogService(
            context.read(),
          ),
        )
      ],
      child: child,
    );
  }
}
