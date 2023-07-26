import 'package:redux/redux.dart';
import 'package:the_shop/app_state.dart';

AppState addToFavoritesReducer(AppState state, AddToFavoritesAction action) {
  state.favoritesIds.add(action.id);
  return state.copyWith(favoritesIds: Set.of(state.favoritesIds));
}

AppState removeFromFavoritesReducer(AppState state, RemoveFromFavorites action) {
  state.favoritesIds.remove(action.id);
  return state.copyWith(favoritesIds: Set.of(state.favoritesIds));
}

AppState addToCartReducer(AppState state, AddToCartAction action) {
  state.shoppingCartIds.add(action.id);
  return state.copyWith(shoppingCartIds: Set.of(state.shoppingCartIds));
}

AppState removeFromCartReducer(AppState state, RemoveFromCartAction action) {
  state.shoppingCartIds.remove(action.id);
  return state.copyWith(shoppingCartIds: Set.of(state.shoppingCartIds));
}

/*Set<int> removeFromFavoritesReducer(Set<int> state, RemoveFromFavorites action) {
  state.remove(action.id);
  return Set.of(state);
}*/

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddToFavoritesAction>(addToFavoritesReducer),
  TypedReducer<AppState, RemoveFromFavorites>(removeFromFavoritesReducer),
  TypedReducer<AppState, AddToCartAction>(addToCartReducer),
  TypedReducer<AppState, RemoveFromCartAction>(removeFromCartReducer),
]);

/*final appReducer = combineReducers<Set<int>>([
  TypedReducer<Set<int>, AddToFavoritesAction>(addToFavoritesReducer),
  TypedReducer<Set<int>, RemoveFromFavorites>(removeFromFavoritesReducer),
]);*/

sealed class Action {
  final int id;

  Action(this.id);
}

final class AddToFavoritesAction extends Action {
  AddToFavoritesAction(super.id);
}

final class RemoveFromFavorites extends Action {
  RemoveFromFavorites(super.id);
}

final class AddToCartAction extends Action {
  AddToCartAction(super.id);
}

final class RemoveFromCartAction extends Action {
  RemoveFromCartAction(super.id);
}