import 'package:equatable/equatable.dart';
import '../models/cart_item.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  final double discountRate;
  final String? appliedCoupon;
  final String? message;

  const CartState({
    this.items = const [],
    this.discountRate = 0.0,
    this.appliedCoupon,
    this.message,
  });

  int get totalItemCount => items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      items.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get discountAmount => subtotal * discountRate;

  double get estimatedTax => (subtotal - discountAmount) * 0.15; // 15% VAT

  double get deliveryFee => subtotal > 0 ? (subtotal > 500 ? 0.0 : 25.0) : 0.0;

  double get finalTotal => subtotal > 0
      ? (subtotal - discountAmount + estimatedTax + deliveryFee)
      : 0.0;

  CartState copyWith({
    List<CartItem>? items,
    double? discountRate,
    String? appliedCoupon,
    String? message,
  }) {
    return CartState(
      items: items ?? this.items,
      discountRate: discountRate ?? this.discountRate,
      appliedCoupon: appliedCoupon ?? this.appliedCoupon,
      message: message,
    );
  }

  @override
  List<Object?> get props => [items, discountRate, appliedCoupon, message];
}
