import 'package:flutter/material.dart';

// what a bout size is very important attrubite????
class ProductItemModel {
  final String id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int numberOfReviews;
  final List<Color> availableColors;
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
    required this.numberOfReviews,
    required this.availableColors,
    required this.category,
    this.isFavorite = false,
    this.isNewArrival = false,
  });
}

List<ProductItemModel> dummyProducts = [
  // --- Category: Shoes ---
  ProductItemModel(
    id: 's1',
    name: 'Nike Air Max 270',
    brand: 'Nike',
    description:
        'The Nike Air Max 270 delivers visible cushioning under every step. Updated for modern comfort, it nods to the original 180 with its exaggerated tongue top and heritage tongue logo. The engineered mesh upper provides breathability, while the foam midsole and large Max Air unit give you world-class comfort for all-day wear. Perfect for both athletic performance and street style.',
    price: 195.0,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5823.png',
    rating: 4.8,
    numberOfReviews: 120,
    availableColors: [Colors.orange, Colors.black, Colors.white],
    category: 'Shoes',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 's2',
    name: 'Adidas Ultraboost',
    brand: 'Adidas',
    description:
        'Experience incredible energy return with the Adidas Ultraboost. These running shoes are built with a responsive Boost midsole that stays comfortable through long miles. The Primeknit upper wraps the foot in a supportive fit that enhances movement. Designed for runners who demand the best in performance and style, ensuring a smooth transition from heel-strike to toe-off.',
    price: 160.0,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5827.png',
    rating: 4.7,
    numberOfReviews: 95,
    availableColors: [Colors.blue, Colors.grey, Colors.black],
    category: 'Shoes',
  ),
  ProductItemModel(
    id: 's3',
    name: 'Jordan Retro High',
    brand: 'Jordan',
    description:
        'The classic silhouette that redefined street style and basketball culture. The Jordan Retro High features premium leather construction for durability and a sophisticated look. With the iconic Air-Sole unit in the heel, it provides lightweight cushioning that fans have loved for decades. Whether on the court or the pavement, these sneakers make a bold statement of heritage and performance.',
    price: 210.0,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5821.png',
    rating: 4.9,
    numberOfReviews: 210,
    availableColors: [Colors.red, Colors.black, Colors.blue],
    category: 'Shoes',
    isNewArrival: true,
  ),

  // --- Category: Tech ---
  ProductItemModel(
    id: 't1',
    name: 'iPhone 14 Pro Max',
    brand: 'Apple',
    description:
        'Experience the magic of Dynamic Island, a transformational new way to interact with iPhone. Powered by the A16 Bionic chip, it features a 48MP Main camera for up to 4x greater resolution. The Pro camera system adds a 2x Telephoto lens and Action mode for smooth handheld video. It’s the ultimate smartphone experience with Ceramic Shield, Always-On display, and an all-day battery life that keeps up with you.',
    price: 1099.0,
    imageUrl: 'https://pngimg.com/d/iphone_14_PNG1.png',
    rating: 4.9,
    numberOfReviews: 540,
    availableColors: [Colors.purple, Colors.black, Colors.blueGrey],
    category: 'Tech',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 't3',
    name: 'AirPods Max',
    brand: 'Apple',
    description:
        'AirPods Max reimagine over-ear headphones. An Apple-designed dynamic driver provides immersive high-fidelity audio. Every detail, from canopy to cushions, has been designed for an exceptional fit. Industry-leading Active Noise Cancellation blocks outside noise, while Transparency mode lets it in. Enjoy a theater-like experience with personalized spatial audio that tracks your head movements.',
    price: 549.0,
    imageUrl: 'https://pngimg.com/d/headphones_PNG101941.png',
    rating: 4.8,
    numberOfReviews: 320,
    availableColors: [Colors.grey, Colors.blue, Colors.pink],
    category: 'Tech',
    isNewArrival: true,
  ),

  // --- Category: Watches ---
  ProductItemModel(
    id: 'w1',
    name: 'Rolex Day-Date',
    brand: 'Rolex',
    description:
        'The Rolex Day-Date is the ultimate watch of prestige and exclusivity. Crafted from the finest precious metals, it was the first calendar wristwatch to indicate the day of the week spelt out in full in addition to the date. Known as the "presidents\' watch," it features a high-precision self-winding mechanical movement and the iconic President bracelet. A true masterpiece of horology and a symbol of success.',
    price: 12000.0,
    imageUrl: 'https://pngimg.com/d/watches_PNG9854.png',
    rating: 4.9,
    numberOfReviews: 45,
    availableColors: [Colors.yellow, Colors.grey],
    category: 'Watches',
  ),
  ProductItemModel(
    id: 'w2',
    name: 'Casio G-Shock',
    brand: 'Casio',
    description:
        'Built for the toughest environments, the Casio G-Shock is the ultimate tough watch. It is shock-resistant, water-resistant to 200 meters, and features a rugged design that can withstand any adventure. With functions like world time, stopwatch, and a super illuminator LED, it is the perfect companion for outdoor enthusiasts and professionals who need a reliable timepiece in any condition.',
    price: 150.0,
    imageUrl: 'https://pngimg.com/d/watches_PNG9886.png',
    rating: 4.6,
    numberOfReviews: 88,
    availableColors: [Colors.black, Colors.red, Colors.green],
    category: 'Watches',
    isNewArrival: true,
  ),

  // --- Category: Laptops ---
  ProductItemModel(
    id: 'l1',
    name: 'MacBook Pro 16"',
    brand: 'Apple',
    description:
        'The most powerful MacBook Pro ever is here. With the blazing-fast M2 Max chip, the first Apple silicon designed for pros, you get groundbreaking performance and amazing battery life. Add to that a stunning Liquid Retina XDR display with extreme dynamic range and a million-to-one contrast ratio. It includes a 1080p FaceTime HD camera, a studio-quality three-mic array, and a six-speaker sound system with Spatial Audio.',
    price: 2499.0,
    imageUrl: 'https://pngimg.com/d/macbook_PNG65.png',
    rating: 5.0,
    numberOfReviews: 200,
    availableColors: [Colors.grey, Colors.blueGrey],
    category: 'Laptops',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 'l2',
    name: 'Dell XPS 13',
    brand: 'Dell',
    description:
        'The Dell XPS 13 is a masterpiece of design and engineering. Featuring a stunning 4K InfinityEdge display with a 16:10 aspect ratio, it offers a larger, more beautiful view. The chassis is sculpted from CNC machined aluminum, making it incredibly thin and light yet durable. With the latest Intel processors and advanced thermal engineering, it provides a smooth and powerful performance for creators on the go.',
    price: 1299.0,
    imageUrl: 'https://pngimg.com/d/laptop_PNG5893.png',
    rating: 4.7,
    numberOfReviews: 110,
    availableColors: [Colors.red, Colors.white],
    category: 'Laptops',
  ),

  // --- Category: Clothes ---
  ProductItemModel(
    id: 'c1',
    name: 'Premium Cotton Tee',
    brand: 'Zara',
    description:
        'Elevate your everyday essentials with our Premium Cotton Tee. Made from 100% organic cotton, this t-shirt offers a soft-touch feel and superior breathability. The modern slim-fit cut ensures a sharp silhouette, while the reinforced stitching provides long-lasting durability. Available in a variety of versatile colors, it is the perfect base layer for any outfit, from casual to smart-casual.',
    price: 35.0,
    imageUrl: 'https://pngimg.com/d/tshirt_PNG5450.png',
    rating: 4.3,
    numberOfReviews: 150,
    availableColors: [Colors.white, Colors.black, Colors.blue],
    category: 'Clothes',
    isNewArrival: true,
  ),
  ProductItemModel(
    id: 'c3',
    name: 'Classic Denim Jacket',
    brand: 'Levi\'s',
    description:
        'A timeless staple built to last, the Levi\'s Classic Denim Jacket is a must-have for every wardrobe. This jacket features a standard fit with a pointed collar and button-flap chest pockets. Crafted from heavy-duty denim that only gets better with age, it provides the perfect balance of ruggedness and style. Wear it over a hoodie or a tee for an effortless, cool look that never goes out of fashion.',
    price: 95.0,
    imageUrl: 'https://pngimg.com/d/jacket_PNG8052.png',
    rating: 4.6,
    numberOfReviews: 95,
    availableColors: [Colors.blue, Colors.lightBlue, Colors.black],
    category: 'Clothes',
    isNewArrival: true,
  ),
];
