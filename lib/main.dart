import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/di/service_locator.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/catalog/bloc/product_bloc.dart';
import 'features/catalog/bloc/product_event.dart';
import 'features/cart/bloc/cart_bloc.dart';
import 'features/favorites/bloc/favorites_bloc.dart';
import 'features/theme/bloc/theme_bloc.dart';
import 'features/theme/bloc/theme_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetIt Dependency Injection Service Locator
  setupServiceLocator();

  runApp(const NovaStoreApp());
}

class NovaStoreApp extends StatelessWidget {
  const NovaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>.value(
          value: sl<ThemeBloc>(),
        ),
        BlocProvider<CartBloc>.value(
          value: sl<CartBloc>(),
        ),
        BlocProvider<FavoritesBloc>.value(
          value: sl<FavoritesBloc>(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => sl<ProductBloc>()..add(const LoadProductsEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'Nova Store',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.themeMode,
            routerConfig: AppRouter.router,
            builder: (context, child) {
              return ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: const [
                  Breakpoint(start: 0, end: 450, name: MOBILE),
                  Breakpoint(start: 451, end: 800, name: TABLET),
                  Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
