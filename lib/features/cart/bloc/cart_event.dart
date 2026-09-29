import 'package:equatable/equatable.dart';
import '../../catalog/models/product_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Product product;
  final String? selectedColor;

  const AddToCartEvent(this.product, {this.selectedColor});

  @override
  List<Object?> get props => [product, selectedColor];
}

class RemoveFromCartEvent extends CartEvent {
  final String productId;

  const RemoveFromCartEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class UpdateQuantityEvent extends CartEvent {
  final String productId;
  final int quantity;

  const UpdateQuantityEvent(this.productId, this.quantity);

  @override
  List<Object?> get props => [productId, quantity];
}

class ClearCartEvent extends CartEvent {
  const ClearCartEvent();
}

class ApplyCouponEvent extends CartEvent {
  final String couponCode;

  const ApplyCouponEvent(this.couponCode);

  @override
  List<Object?> get props => [couponCode];
}
