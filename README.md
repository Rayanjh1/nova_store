# 📱 Nova Store - Modern E-Commerce Flutter Application

A responsive, high-performance Flutter e-commerce application built with clean architecture, adhering to industry best practices and strict design patterns.

---

## 🌟 Key Requirements & Features

### 📦 Packages Implemented
As requested, this project is built using the core specified libraries:
- **`bloc` & `flutter_bloc`**: State management for Cart, Wishlist, Product Catalog filtering, and Theme mode.
- **`go_router`**: Declarative routing architecture with path parameters (`/product/:id`) and persistent shell navigation.
- **`get_it`**: Dependency injection and service locator for inversion of control and testability.
- **`responsive_framework`**: Adaptive UI supporting Mobile, Tablet, and Desktop screen breakpoints.

---

## 🖥️ Screens Overview (7 Complete Interfaces)

1. **Splash & Welcome Screen (`/`)**:
   - Animated entrance, branding, slogan, and entry call-to-action.
2. **Home / Dashboard Screen (`/home`)**:
   - Promotional carousel banners (with promo code coupons).
   - Horizontal category filters.
   - Featured technology section (horizontal scroll).
   - Trending products grid with dynamic badges.
3. **Explore / Catalog Screen (`/catalog`)**:
   - Real-time search query filter.
   - Category filtering chips (`All`, `Audio`, `Laptops`, `Phones`, `Wearables`, `Accessories`).
   - Responsive multi-column grid with live result counter.
4. **Product Details Screen (`/product/:id`)**:
   - High-resolution hero product image.
   - Price, discount percentage, rating, review counter.
   - Interactive color variant picker.
   - Full product description and feature chips.
   - Sticky bottom bar with quantity increment/decrement stepper and **Add to Cart** action.
5. **Shopping Cart Screen (`/cart`)**:
   - List of items with real-time quantity controls and item removal.
   - Promo coupon code validator (`PROMO10`, `VIP20`).
   - Comprehensive cost breakdown (Subtotal, Discount, 15% VAT, Free delivery tier, Final Total).
   - Checkout confirmation dialog with order completion simulation.
6. **Wishlist / Favorites Screen (`/favorites`)**:
   - Saved items management.
   - Quick add-to-cart integration.
   - Empty state with direct link to exploration.
7. **Profile & Settings Screen (`/profile`)**:
   - User profile credentials and VIP status indicator.
   - **Dark Mode / Light Mode** theme switcher powered by `ThemeBloc`.
   - Settings management (Order History, Delivery Addresses, Payment Methods, Notifications).
   - Help & Support and Sign Out dialog.

---

## 🏗️ Architecture & Folder Structure

```
lib/
├── core/
│   ├── di/
│   │   └── service_locator.dart       # GetIt Service Locator
│   ├── router/
│   │   └── app_router.dart            # GoRouter configuration & routes
│   ├── theme/
│   │   └── app_theme.dart             # Modern Light and Dark theme palettes
│   └── widgets/
│       └── responsive_layout.dart     # Responsive layout helper & breakpoints
├── features/
│   ├── catalog/
│   │   ├── bloc/                      # ProductBloc, Event, State
│   │   ├── models/                    # Product model
│   │   ├── repositories/              # MockProductRepository (Clean Architecture)
│   │   ├── screens/                   # Splash, Home, Catalog, ProductDetail
│   │   └── widgets/                   # ProductCard widget
│   ├── cart/
│   │   ├── bloc/                      # CartBloc, Event, State
│   │   ├── models/                    # CartItem model
│   │   └── screens/                   # CartScreen
│   ├── favorites/
│   │   ├── bloc/                      # FavoritesBloc, Event, State
│   │   └── screens/                   # FavoritesScreen
│   ├── profile/
│   │   └── screens/                   # ProfileScreen
│   └── theme/
│       └── bloc/                      # ThemeBloc, Event, State
├── shell/
│   └── main_wrapper_screen.dart       # Responsive Shell (BottomNavigationBar / NavigationRail)
└── main.dart                          # App entry point, MultiBlocProvider, Responsive setup
```

---

## 🚀 How to Run the App

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed (version >= 3.0.0).

### Steps:
1. **Clone the repository:**
   ```bash
   git clone <REPO_URL>
   cd nova_store
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run on any platform (Android, iOS, Web, Windows, macOS):**
   ```bash
   flutter run
   ```

---

## 💎 Highlights
- **100% Null-Safety**
- **Equatables** for optimal Bloc state rebuilds
- **Dynamic Theme Mode Switching** (System, Light, Dark)
- **Zero Hardcoded Routes** (GoRouter typed paths)
- **Fully Responsive** for Phones, Tablets, and Web/Desktop
