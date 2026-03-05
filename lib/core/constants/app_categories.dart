import 'package:remixicon/remixicon.dart';
import 'package:flutter/material.dart';

class AppCategory {
  final String name;
  final String searchQuery;
  final IconData icon;
  final String imageUrl;

  const AppCategory({
    required this.name,
    required this.searchQuery,
    required this.icon,
    required this.imageUrl,
  });
}

// const List<AppCategory> homeCategories = [
//   AppCategory(name: 'All', searchQuery: 'all', icon: Remix.apps_line),
//   AppCategory(
//     name: 'Electronics',
//     searchQuery: 'electronics',
//     icon: Remix.computer_line,
//   ),
//   AppCategory(
//     name: 'Clothing',
//     searchQuery: 'clothing',
//     icon: Remix.t_shirt_line,
//   ),
//   AppCategory(name: 'Shoes', searchQuery: 'shoes', icon: Remix.footprint_line),
//   AppCategory(name: 'Beauty', searchQuery: 'beauty', icon: Remix.heart_line),
//   AppCategory(name: 'Home', searchQuery: 'home decor', icon: Remix.home_line),
//   AppCategory(name: 'Sports', searchQuery: 'sports', icon: Remix.football_line),
// ];

const List<AppCategory> homeCategories = [
  AppCategory(
    name: 'All',
    searchQuery: 'all',
    icon: Remix.apps_line,
    imageUrl: 'https://pngimg.com/d/shopping_cart_PNG38.png',
  ),
  AppCategory(
    name: 'Electronics',
    searchQuery: 'electronics',
    icon: Remix.computer_line,
    imageUrl: 'https://pngimg.com/d/iphone_14_PNG1.png',
  ),
  AppCategory(
    name: 'Clothing',
    searchQuery: 'clothing',
    icon: Remix.t_shirt_line,
    imageUrl: 'https://pngimg.com/d/tshirt_PNG5450.png',
  ),
  AppCategory(
    name: 'Shoes',
    searchQuery: 'shoes',
    icon: Remix.footprint_line,
    imageUrl: 'https://pngimg.com/d/running_shoes_PNG5823.png',
  ),
  AppCategory(
    name: 'Beauty',
    searchQuery: 'beauty',
    icon: Remix.heart_line,
    imageUrl: 'https://pngimg.com/d/perfume_PNG10317.png',
  ),
  AppCategory(
    name: 'Home',
    searchQuery: 'home decor',
    icon: Remix.home_line,
    imageUrl: 'https://pngimg.com/d/armchair_PNG7039.png',
  ),
  AppCategory(
    name: 'Sports',
    searchQuery: 'sports',
    icon: Remix.football_line,
    imageUrl: 'https://pngimg.com/d/basketball_PNG1102.png',
  ),
];

// // const List<AppCategory> homeCategories = [
//   AppCategory(
//     name: 'All',
//     searchQuery: 'all',
//     icon: Remix.apps_line,
//     imageUrl:
//         'https://purepng.com/public/uploads/large/purepng.com-shopping-bagshopping-bagobjectsshopping-bag-17015283538466atux.png',
//   ),
//   AppCategory(
//     name: 'Electronics',
//     searchQuery: 'electronics',
//     icon: Remix.computer_line,
//     imageUrl:
//         'https://purepng.com/public/uploads/large/purepng.com-macbookmacbooknotebookcomputersapple-incmacbook-family-17015283611449at26.png',
//   ),
//   AppCategory(
//     name: 'Clothing',
//     searchQuery: 'clothing',
//     icon: Remix.t_shirt_line,
//     imageUrl:
//         'https://purepng.com/public/uploads/large/purepng.com-suitssuitscoat-and-trousersclothing-1701528322049dclre.png',
//   ),
//   AppCategory(
//     name: 'Shoes',
//     searchQuery: 'shoes',
//     icon: Remix.footprint_line,
//     imageUrl:
//         'https://purepng.com/public/uploads/large/purepng.com-nike-shoes-for-mennike-shoes-for-mennike-shoes-for-mennike-shoesnike-1701528189569u6z7m.png',
//   ),
//   AppCategory(
//     name: 'Beauty',
//     searchQuery: 'beauty',
//     icon: Remix.heart_line,
//     imageUrl:
//         'https://purepng.com/public/uploads/large/purepng.com-beauty-productbeauty-productcosmetic-itemsbeauty-face-powder-1701528221623pnt7z.png',
//   ),
//   AppCategory(
//     name: 'Home',
//     searchQuery: 'home decor',
//     icon: Remix.home_line,
//     imageUrl:
//         'https://purepng.com/public/uploads/large/purepng.com-furniturefurniture-objectshome-furnishing-furniture-items-1701528353272nupru.png',
//   ),
//   AppCategory(
//     name: 'Sports',
//     searchQuery: 'sports',
//     icon: Remix.football_line,
//     imageUrl:
//         'https://purepng.com/public/uploads/large/purepng.com-basketballbasketballballsports-equipmentbasketball-ball-1701528211025m84is.png',
//   ),
// ];
