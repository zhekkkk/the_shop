import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:the_shop/app_dependencies.dart';
import 'package:the_shop/app_state.dart';
import 'package:the_shop/pages/favorites_page/favorites.dart';
import 'package:the_shop/the_shop_app.dart';

void main() {

  final store = Store<AppState>(appReducer, initialState: AppState(favoritesIds: {}, shoppingCartIds: {}));

  runApp(
    StoreProvider(
      store: store,
      child: AppDependencies(
        child: TheShopApp(),
      ),
    ),
  );
}
