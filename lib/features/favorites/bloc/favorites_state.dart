import 'package:equatable/equatable.dart';
import '../../catalog/models/product_model.dart';

class FavoritesState extends Equatable {
  final List<Product> favorites;

  const FavoritesState({this.favorites = const []});

  bool isFavorite(String productId) =>
      favorites.any((product) => product.id == productId);

  int get totalCount => favorites.length;

  FavoritesState copyWith({List<Product>? favorites}) {
    return FavoritesState(favorites: favorites ?? this.favorites);
  }

  @override
  List<Object?> get props => [favorites];
}
