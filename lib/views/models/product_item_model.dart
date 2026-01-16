class ProductItemModel {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final String category;
  final bool isFavorite;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.category,
    this.isFavorite = false,
  });
}

List<ProductItemModel> dummyProducts = [
  // --- Category: Shoes ---
  ProductItemModel(
    id: 'p1',
    name: 'The Mirac Jiz',
    brand: 'Lisa Robber',
    description:
        'حذاء رياضي أنيق ومريح يتميز بتقنيات توسيد هوائي متقدمة لأداء مثالي.',
    price: 195.00,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5823.png',
    rating: 4.8,
    category: 'Shoes',
    isFavorite: false,
  ),
  ProductItemModel(
    id: 'p2',
    name: 'Meriza Kiles',
    brand: 'Gazuna Resika',
    description:
        'سنيكرز رياضي متعدد الاستخدامات مصمم للمتانة وراحة القدم في التمارين اليومية.',
    price: 143.45,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5827.png',
    rating: 4.5,
    category: 'Shoes',
    isFavorite: false,
  ),

  // --- Category: Tech ---
  ProductItemModel(
    id: 'p3',
    name: 'iPhone 14 Pro Max',
    brand: 'Apple Store',
    description: 'اختبر الأداء الأقصى مع أحدث شريحة ونظام كاميرا احترافي مذهل.',
    price: 1099.00,
    imageUrl: 'https://pngimg.com/d/iphone_14_PNG1.png',
    rating: 4.9,
    category: 'Tech',
    isFavorite: true,
  ),
  ProductItemModel(
    id: 'p4',
    name: 'MacBook Pro 16"',
    brand: 'Apple Tech',
    description:
        'أقوى لابتوب للمحترفين، يتميز بشريحة M2 وشاشة Liquid Retina XDR رائعة.',
    price: 2499.00,
    imageUrl: 'https://pngimg.com/d/macbook_PNG65.png',
    rating: 5.0,
    category: 'Tech',
    isFavorite: false,
  ),

  // --- Category: Watches ---
  ProductItemModel(
    id: 'p5',
    name: 'Classic Gold Watch',
    brand: 'Rolex Luxury',
    description: 'ساعة أنيقة مصنوعة من مواد ممتازة لتكمل مظهرك الرسمي.',
    price: 250.00,
    imageUrl: 'https://pngimg.com/d/watches_PNG9854.png',
    rating: 4.7,
    category: 'Watches',
    isFavorite: false,
  ),
  ProductItemModel(
    id: 'p6',
    name: 'Luxury Silver Watch',
    brand: 'Casio Brand',
    description: 'ساعة فاخرة مقاومة للماء بتصميم عصري يناسب الرجل المعاصر.',
    price: 450.00,
    imageUrl: 'https://pngimg.com/d/watches_PNG9886.png',
    rating: 4.6,
    category: 'Watches',
    isFavorite: true,
  ),

  // --- Category: Bags ---
  ProductItemModel(
    id: 'p7',
    name: 'Classic Urban Backpack',
    brand: 'Adidas Bag',
    description: 'حقيبة ظهر واسعة ومتينة مع أقسام متعددة لجميع مستلزمات سفرك.',
    price: 85.00,
    imageUrl: 'https://pngimg.com/d/backpack_PNG6343.png',
    rating: 4.3,
    category: 'Bags',
    isFavorite: false,
  ),
  ProductItemModel(
    id: 'p8',
    name: 'Outdoor Travel Bag',
    brand: 'Nike Sport',
    description:
        'حقيبة ظهر شديدة التحمل مصممة للمشي لمسافات طويلة والمغامرات الخارجية.',
    price: 120.00,
    imageUrl: 'https://pngimg.com/d/backpack_PNG6355.png',
    rating: 4.4,
    category: 'Bags',
    isFavorite: false,
  ),
];
