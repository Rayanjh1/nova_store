import '../models/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<Product>> getFeaturedProducts();
  Future<List<String>> getCategories();
  Future<Product?> getProductById(String id);
  Future<List<Product>> searchProducts(String query, {String? category});
}

class MockProductRepository implements ProductRepository {
  final List<Product> _products = const [
    Product(
      id: 'p1',
      title: 'Quantum Wireless Headphones X1',
      description:
          'Experience studio-grade acoustic fidelity with high-resolution active noise cancellation, 45-hour battery life, and ultra-plush memory foam ear cups designed for all-day comfort.',
      price: 249.99,
      originalPrice: 299.99,
      rating: 4.8,
      reviewsCount: 342,
      category: 'Audio',
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800&auto=format&fit=crop&q=80',
      tags: ['Wireless', 'ANC', 'Hi-Res', 'Bluetooth 5.3'],
      isFeatured: true,
      colors: ['#1A1A1A', '#Silver', '#MidnightBlue'],
    ),
    Product(
      id: 'p2',
      title: 'AuraBook Pro 16 Ultra M3',
      description:
          'Engineered for extreme performance and creative workflows. Powered by next-gen silicon, a stunning 120Hz Liquid Retina XDR display, and 22-hour battery endurance.',
      price: 1899.00,
      originalPrice: 2199.00,
      rating: 4.9,
      reviewsCount: 512,
      category: 'Laptops',
      imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800&auto=format&fit=crop&q=80',
      tags: ['16GB RAM', '1TB SSD', 'M3 Chip', 'Retina'],
      isFeatured: true,
      colors: ['#SpaceGray', '#Silver', '#Midnight'],
    ),
    Product(
      id: 'p3',
      title: 'Chronos Smartwatch Elite Series 9',
      description:
          'Track your health, ECG, blood oxygen, and athletic metrics with millimeter accuracy. Sapphire crystal touch screen encased in lightweight titanium.',
      price: 399.50,
      originalPrice: 449.00,
      rating: 4.7,
      reviewsCount: 189,
      category: 'Wearables',
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800&auto=format&fit=crop&q=80',
      tags: ['Titanium', 'ECG', 'Waterproof 50m', 'GPS'],
      isFeatured: true,
      colors: ['#Black', '#Titanium', '#RoseGold'],
    ),
    Product(
      id: 'p4',
      title: 'NovaPhone 15 Pro Max',
      description:
          'Revolutionary titanium frame, triple 48MP pro camera system with 5x optical zoom, and the fastest mobile chip on earth with ray tracing graphics.',
      price: 1199.00,
      originalPrice: 1299.00,
      rating: 4.9,
      reviewsCount: 820,
      category: 'Phones',
      imageUrl: 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=800&auto=format&fit=crop&q=80',
      tags: ['5G', '256GB', 'Titanium', 'Pro Camera'],
      isFeatured: true,
      colors: ['#NaturalTitanium', '#BlackTitanium', '#BlueTitanium'],
    ),
    Product(
      id: 'p5',
      title: 'Zenith Mechanical Keyboard RGB',
      description:
          'Custom hot-swappable tactile switches, gasket mounted CNC aluminum body, PBT dye-sub keycaps, and ultra-low latency wireless tri-mode connectivity.',
      price: 149.00,
      originalPrice: 179.00,
      rating: 4.6,
      reviewsCount: 95,
      category: 'Accessories',
      imageUrl: 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=800&auto=format&fit=crop&q=80',
      tags: ['Hot-Swap', 'RGB', 'Wireless', 'Gasket Mount'],
      isFeatured: false,
      colors: ['#White', '#CarbonBlack'],
    ),
    Product(
      id: 'p6',
      title: 'Precision Master Wireless Mouse 3S',
      description:
          'Ergonomic contouring, quiet click switches, MagSpeed electromagnetic scrolling, and 8,000 DPI tracking on any glass or desk surface.',
      price: 99.99,
      originalPrice: 119.99,
      rating: 4.8,
      reviewsCount: 420,
      category: 'Accessories',
      imageUrl: 'https://images.unsplash.com/photo-1615663245857-ac93bb7c39e7?w=800&auto=format&fit=crop&q=80',
      tags: ['Ergonomic', 'Quiet Clicks', 'Bluetooth', 'Multi-device'],
      isFeatured: false,
      colors: ['#Graphite', '#PaleGrey'],
    ),
    Product(
      id: 'p7',
      title: 'SoundSphere Studio Smart Speaker',
      description:
          'Room-filling 360-degree spatial audio with custom woofer, five beamforming tweeters, and seamless voice control integration.',
      price: 289.00,
      originalPrice: 329.00,
      rating: 4.5,
      reviewsCount: 160,
      category: 'Audio',
      imageUrl: 'https://images.unsplash.com/photo-1545454675-3531b543be5d?w=800&auto=format&fit=crop&q=80',
      tags: ['Spatial Audio', 'Smart Home', 'WiFi', 'AirPlay 2'],
      isFeatured: false,
      colors: ['#Midnight', '#White'],
    ),
    Product(
      id: 'p8',
      title: 'VisionPad Ultra 12.9 Tablet',
      description:
          'Stunning OLED tandem display, stylus hover technology, and all-day battery life for digital illustrators, students, and professionals.',
      price: 899.00,
      originalPrice: 999.00,
      rating: 4.7,
      reviewsCount: 275,
      category: 'Laptops',
      imageUrl: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=800&auto=format&fit=crop&q=80',
      tags: ['OLED', 'Stylus Ready', '256GB', 'Wi-Fi 6E'],
      isFeatured: false,
      colors: ['#SpaceBlack', '#Silver'],
    ),
  ];

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _products;
  }

  @override
  Future<List<Product>> getFeaturedProducts() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _products.where((p) => p.isFeatured).toList();
  }

  @override
  Future<List<String>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    final categories = _products.map((p) => p.category).toSet().toList();
    categories.sort();
    return ['All', ...categories];
  }

  @override
  Future<Product?> getProductById(String id) async {
    await Future.delayed(const Duration(milliseconds: 150));
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Product>> searchProducts(String query, {String? category}) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return _products.where((product) {
      final matchesQuery = query.isEmpty ||
          product.title.toLowerCase().contains(query.toLowerCase()) ||
          product.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase()));
      final matchesCategory = category == null ||
          category == 'All' ||
          product.category.toLowerCase() == category.toLowerCase();
      return matchesQuery && matchesCategory;
    }).toList();
  }
}
