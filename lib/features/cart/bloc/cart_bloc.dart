import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_item.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<UpdateQuantityEvent>(_onUpdateQuantity);
    on<ClearCartEvent>(_onClearCart);
    on<ApplyCouponEvent>(_onApplyCoupon);
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == event.product.id,
    );

    List<CartItem> updatedItems;
    if (existingIndex >= 0) {
      updatedItems = List.from(state.items);
      final currentItem = updatedItems[existingIndex];
      updatedItems[existingIndex] = currentItem.copyWith(
        quantity: currentItem.quantity + 1,
      );
    } else {
      updatedItems = [
        ...state.items,
        CartItem(
          product: event.product,
          quantity: 1,
          selectedColor: event.selectedColor,
        ),
      ];
    }

    emit(state.copyWith(
      items: updatedItems,
      message: 'Added "${event.product.title}" to cart',
    ));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    final updatedItems = state.items
        .where((item) => item.product.id != event.productId)
        .toList();
    emit(state.copyWith(
      items: updatedItems,
      message: 'Item removed from cart',
    ));
  }

  void _onUpdateQuantity(UpdateQuantityEvent event, Emitter<CartState> emit) {
    if (event.quantity <= 0) {
      add(RemoveFromCartEvent(event.productId));
      return;
    }

    final updatedItems = state.items.map((item) {
      if (item.product.id == event.productId) {
        return item.copyWith(quantity: event.quantity);
      }
      return item;
    }).toList();

    emit(state.copyWith(items: updatedItems));
  }

  void _onClearCart(ClearCartEvent event, Emitter<CartState> emit) {
    emit(const CartState(message: 'Cart cleared successfully'));
  }

  void _onApplyCoupon(ApplyCouponEvent event, Emitter<CartState> emit) {
    final cleanCode = event.couponCode.trim().toUpperCase();
    if (cleanCode == 'PROMO10' || cleanCode == 'SAVE10') {
      emit(state.copyWith(
        discountRate: 0.10,
        appliedCoupon: cleanCode,
        message: '10% discount applied!',
      ));
    } else if (cleanCode == 'VIP20') {
      emit(state.copyWith(
        discountRate: 0.20,
        appliedCoupon: cleanCode,
        message: 'VIP 20% discount applied!',
      ));
    } else {
      emit(state.copyWith(
        message: 'Invalid promo code. Try PROMO10 or VIP20',
      ));
    }
  }
}
