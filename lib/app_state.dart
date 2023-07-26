class AppState {
  final Set<int> favoritesIds;
  final Set<int> shoppingCartIds;

  AppState({
    required this.shoppingCartIds,
    required this.favoritesIds,
  });

  AppState copyWith({
    Set<int>? favoritesIds,
    Set<int>? shoppingCartIds,
  }) {
    return AppState(
      shoppingCartIds: shoppingCartIds ?? this.shoppingCartIds,
      favoritesIds: favoritesIds ?? this.favoritesIds,
    );
  }
}
