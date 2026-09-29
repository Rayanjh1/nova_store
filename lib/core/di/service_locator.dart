import 'package:get_it/get_it.dart';
import '../../features/catalog/repositories/product_repository.dart';
import '../../features/catalog/bloc/product_bloc.dart';
import '../../features/cart/bloc/cart_bloc.dart';
import '../../features/favorites/bloc/favorites_bloc.dart';
import '../../features/theme/bloc/theme_bloc.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  // Repositories
  sl.registerLazySingleton<ProductRepository>(() => MockProductRepository());

  // Blocs
  sl.registerLazySingleton<ThemeBloc>(() => ThemeBloc());
  sl.registerLazySingleton<CartBloc>(() => CartBloc());
  sl.registerLazySingleton<FavoritesBloc>(() => FavoritesBloc());
  sl.registerFactory<ProductBloc>(() => ProductBloc(sl<ProductRepository>()));
}
