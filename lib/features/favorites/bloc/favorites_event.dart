import 'package:equatable/equatable.dart';
import '../../catalog/models/product_model.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class ToggleFavoriteEvent extends FavoritesEvent {
  final Product product;

  const ToggleFavoriteEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveFavoriteEvent extends FavoritesEvent {
  final String productId;

  const RemoveFavoriteEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}
