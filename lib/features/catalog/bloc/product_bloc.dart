import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc(this._productRepository) : super(const ProductState()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<SelectCategoryEvent>(_onSelectCategory);
    on<SearchProductsEvent>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final products = await _productRepository.getProducts();
      final featured = await _productRepository.getFeaturedProducts();
      final categories = await _productRepository.getCategories();

      emit(state.copyWith(
        status: ProductStatus.loaded,
        products: products,
        featuredProducts: featured,
        categories: categories,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductStatus.error,
        errorMessage: 'Failed to load products: $e',
      ));
    }
  }

  Future<void> _onSelectCategory(
    SelectCategoryEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(
      status: ProductStatus.loading,
      selectedCategory: event.category,
    ));
    try {
      final filtered = await _productRepository.searchProducts(
        state.searchQuery,
        category: event.category,
      );
      emit(state.copyWith(
        status: ProductStatus.loaded,
        products: filtered,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductStatus.error,
        errorMessage: 'Failed to filter category: $e',
      ));
    }
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(
      status: ProductStatus.loading,
      searchQuery: event.query,
    ));
    try {
      final searchResults = await _productRepository.searchProducts(
        event.query,
        category: state.selectedCategory,
      );
      emit(state.copyWith(
        status: ProductStatus.loaded,
        products: searchResults,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductStatus.error,
        errorMessage: 'Failed to search products: $e',
      ));
    }
  }
}
