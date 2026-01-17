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
  final bool isNewArrival;

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
    this.isNewArrival = false,
  });
}

List<ProductItemModel> dummyProducts = [
  // --- Category: Shoes (3 items) ---
  ProductItemModel(
    id: 's1',
    name: 'Nike Air Max 270',
    brand: 'Nike',
    description:
        'The Nike Air Max 270 delivers visible cushioning under every step with a super-soft feel.',
    price: 195.0,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5823.png',
    rating: 4.8,
    category: 'Shoes',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 's2',
    name: 'Adidas Ultraboost',
    brand: 'Adidas',
    description:
        'Experience incredible energy return and comfort with the legendary Ultraboost cushioning.',
    price: 160.0,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5827.png',
    rating: 4.7,
    category: 'Shoes',
  ),
  ProductItemModel(
    id: 's3',
    name: 'Jordan Retro High',
    brand: 'Jordan',
    description:
        'The classic silhouette that redefined street style, featuring premium leather.',
    price: 210.0,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5821.png',
    rating: 4.9,
    category: 'Shoes',
    isNewArrival: true,
  ),

  // --- Category: Tech/Phones (2 items) ---
  ProductItemModel(
    id: 't1',
    name: 'iPhone 14 Pro Max',
    brand: 'Apple',
    description:
        'Experience the magic of Dynamic Island and a 48MP camera for stunning photos.',
    price: 1099.0,
    imageUrl: 'https://pngimg.com/d/iphone_14_PNG1.png',
    rating: 4.9,
    category: 'Tech',
    isNewArrival: true,
  ),

  ProductItemModel(
    id: 't3',
    name: 'AirPods Max',
    brand: 'Apple',
    description:
        'High-fidelity audio meets industry-leading Active Noise Cancellation.',
    price: 549.0,
    imageUrl: 'https://pngimg.com/d/headphones_PNG101941.png',
    rating: 4.8,
    category: 'Tech',
    isNewArrival: true,
  ),

  // --- Category: Watches (3 items) ---
  ProductItemModel(
    id: 'w1',
    name: 'Rolex Day-Date',
    brand: 'Rolex',
    description:
        'The ultimate watch of prestige, crafted from 18 ct yellow gold.',
    price: 12000.0,
    imageUrl: 'https://pngimg.com/d/watches_PNG9854.png',
    rating: 4.9,
    category: 'Watches',
  ),
  ProductItemModel(
    id: 'w2',
    name: 'Casio G-Shock',
    brand: 'Casio',
    description:
        'Built for the toughest environments, this watch is shock-resistant.',
    price: 150.0,
    imageUrl: 'https://pngimg.com/d/watches_PNG9886.png',
    rating: 4.6,
    category: 'Watches',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 'w3',
    name: 'Apple Watch S8',
    brand: 'Apple',
    description:
        'Advanced health sensors provide insights to help you understand your wellness.',
    price: 399.0,
    imageUrl: 'https://pngimg.com/d/watches_PNG9883.png',
    rating: 4.7,
    category: 'Watches',
  ),

  // --- Category: Laptops (3 items) - المبدل بدلاً من الحقائب ---
  ProductItemModel(
    id: 'l1',
    name: 'MacBook Pro 16"',
    brand: 'Apple',
    description: 'Powerful performance for professionals with the M2 Max chip.',
    price: 2499.0,
    imageUrl: 'https://pngimg.com/d/macbook_PNG65.png',
    rating: 5.0,
    category: 'Laptops',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 'l2',
    name: 'Dell XPS 13',
    brand: 'Dell',
    description:
        'Stunning 4K display in a compact and premium aluminum design.',
    price: 1299.0,
    imageUrl: 'https://pngimg.com/d/laptop_PNG5893.png',
    rating: 4.7,
    category: 'Laptops',
  ),
  ProductItemModel(
    id: 'l3',
    name: 'Surface Laptop 5',
    brand: 'Microsoft',
    description:
        'Sleek and portable with a vibrant touchscreen for everyday productivity.',
    price: 999.0,
    imageUrl: 'https://pngimg.com/d/laptop_PNG5891.png',
    rating: 4.5,
    category: 'Laptops',
  ),

  // --- Category: Clothes (3 items) ---
  ProductItemModel(
    id: 'c1',
    name: 'Premium Cotton Tee',
    brand: 'Zara',
    description: 'Soft-touch premium cotton t-shirt with a modern fit.',
    price: 35.0,
    imageUrl: 'https://pngimg.com/d/tshirt_PNG5450.png',
    rating: 4.3,
    category: 'Clothes',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 'c2',
    name: 'Winter Black Hoodie',
    brand: 'H&M',
    description: 'Stay warm and stylish with this heavyweight fleece hoodie.',
    price: 55.0,
    imageUrl: 'https://pngimg.com/d/hoodie_PNG40.png',
    rating: 4.5,
    category: 'Clothes',
  ),
  ProductItemModel(
    id: 'c3',
    name: 'Classic Denim Jacket',
    brand: 'Levi\'s',
    description: 'A timeless staple, this denim jacket is built to last.',
    price: 95.0,
    imageUrl: 'https://pngimg.com/d/jacket_PNG8052.png',
    rating: 4.6,
    category: 'Clothes',
    isNewArrival: true,
  ),
];
