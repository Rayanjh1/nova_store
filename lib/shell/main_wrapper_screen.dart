import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../features/cart/bloc/cart_bloc.dart';
import '../features/cart/bloc/cart_state.dart';
import '../features/favorites/bloc/favorites_bloc.dart';
import '../features/favorites/bloc/favorites_state.dart';

class MainWrapperScreen extends StatelessWidget {
  final Widget child;

  const MainWrapperScreen({super.key, required this.child});

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/catalog')) return 1;
    if (location.startsWith('/favorites')) return 2;
    if (location.startsWith('/cart')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/catalog');
        break;
      case 2:
        context.go('/favorites');
        break;
      case 3:
        context.go('/cart');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = _calculateSelectedIndex(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth >= 800;

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        return BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, favState) {
            final cartCount = cartState.totalItemCount;
            final favCount = favState.totalCount;

            if (isWideScreen) {
              return Scaffold(
                body: Row(
                  children: [
                    NavigationRail(
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (idx) => _onItemTapped(idx, context),
                      labelType: NavigationRailLabelType.all,
                      leading: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Icon(
                          Icons.bolt_rounded,
                          size: 36,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      destinations: [
                        const NavigationRailDestination(
                          icon: Icon(Icons.home_outlined),
                          selectedIcon: Icon(Icons.home_rounded),
                          label: Text('Home'),
                        ),
                        const NavigationRailDestination(
                          icon: Icon(Icons.explore_outlined),
                          selectedIcon: Icon(Icons.explore_rounded),
                          label: Text('Explore'),
                        ),
                        NavigationRailDestination(
                          icon: Badge(
                            isLabelVisible: favCount > 0,
                            label: Text('$favCount'),
                            child: const Icon(Icons.favorite_border_rounded),
                          ),
                          selectedIcon: Badge(
                            isLabelVisible: favCount > 0,
                            label: Text('$favCount'),
                            child: const Icon(Icons.favorite_rounded),
                          ),
                          label: const Text('Wishlist'),
                        ),
                        NavigationRailDestination(
                          icon: Badge(
                            isLabelVisible: cartCount > 0,
                            label: Text('$cartCount'),
                            child: const Icon(Icons.shopping_cart_outlined),
                          ),
                          selectedIcon: Badge(
                            isLabelVisible: cartCount > 0,
                            label: Text('$cartCount'),
                            child: const Icon(Icons.shopping_cart_rounded),
                          ),
                          label: const Text('Cart'),
                        ),
                        const NavigationRailDestination(
                          icon: Icon(Icons.person_outline_rounded),
                          selectedIcon: Icon(Icons.person_rounded),
                          label: Text('Profile'),
                        ),
                      ],
                    ),
                    const VerticalDivider(thickness: 1, width: 1),
                    Expanded(child: child),
                  ],
                ),
              );
            }

            return Scaffold(
              body: child,
              bottomNavigationBar: NavigationBar(
                selectedIndex: selectedIndex,
                onDestinationSelected: (idx) => _onItemTapped(idx, context),
                destinations: [
                  const NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    selectedIcon: Icon(Icons.home_rounded),
                    label: 'Home',
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.explore_outlined),
                    selectedIcon: Icon(Icons.explore_rounded),
                    label: 'Explore',
                  ),
                  NavigationDestination(
                    icon: Badge(
                      isLabelVisible: favCount > 0,
                      label: Text('$favCount'),
                      child: const Icon(Icons.favorite_border_rounded),
                    ),
                    selectedIcon: Badge(
                      isLabelVisible: favCount > 0,
                      label: Text('$favCount'),
                      child: const Icon(Icons.favorite_rounded),
                    ),
                    label: 'Wishlist',
                  ),
                  NavigationDestination(
                    icon: Badge(
                      isLabelVisible: cartCount > 0,
                      label: Text('$cartCount'),
                      child: const Icon(Icons.shopping_cart_outlined),
                    ),
                    selectedIcon: Badge(
                      isLabelVisible: cartCount > 0,
                      label: Text('$cartCount'),
                      child: const Icon(Icons.shopping_cart_rounded),
                    ),
                    label: 'Cart',
                  ),
                  const NavigationDestination(
                    icon: Icon(Icons.person_outline_rounded),
                    selectedIcon: Icon(Icons.person_rounded),
                    label: 'Profile',
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
