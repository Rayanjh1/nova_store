import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_event.dart';
import 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState()) {
    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
  }

  void _onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<FavoritesState> emit,
  ) {
    final isAlreadyFav = state.isFavorite(event.product.id);
    if (isAlreadyFav) {
      emit(state.copyWith(
        favorites:
            state.favorites.where((p) => p.id != event.product.id).toList(),
      ));
    } else {
      emit(state.copyWith(
        favorites: [...state.favorites, event.product],
      ));
    }
  }

  void _onRemoveFavorite(
    RemoveFavoriteEvent event,
    Emitter<FavoritesState> emit,
  ) {
    emit(state.copyWith(
      favorites: state.favorites.where((p) => p.id != event.productId).toList(),
    ));
  }
}
