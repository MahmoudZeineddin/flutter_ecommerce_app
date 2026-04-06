import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class AppCategory {
  final String name;
  final String searchQuery;
  final IconData icon;
  final List<AppCategory> subCategories;

  const AppCategory({
    required this.name,
    required this.searchQuery,
    required this.icon,
    this.subCategories = const [],
  });
}

const List<AppCategory> appCategories = [
  AppCategory(
    name: 'Electronics',
    searchQuery: 'electronics',
    icon: Remix.computer_line,
    subCategories: [
      AppCategory(
        name: 'Phones',
        searchQuery: 'phones',
        icon: Remix.smartphone_line,
      ),
      AppCategory(
        name: 'Laptops',
        searchQuery: 'laptops',
        icon: Remix.macbook_line,
      ),
      AppCategory(
        name: 'Audio',
        searchQuery: 'audio headphones',
        icon: Remix.headphone_line,
      ),
      AppCategory(
        name: 'Gaming',
        searchQuery: 'gaming',
        icon: Remix.gamepad_line,
      ),
      AppCategory(
        name: 'Cameras',
        searchQuery: 'cameras',
        icon: Remix.camera_line,
      ),
      AppCategory(
        name: 'Watches',
        searchQuery: 'smart watch',
        icon: Remix.a_24_hours_fill,
      ),
    ],
  ),
  AppCategory(
    name: 'Fashion',
    searchQuery: 'fashion',
    icon: Remix.t_shirt_line,
    subCategories: [
      AppCategory(
        name: 'Men',
        searchQuery: 'men fashion',
        icon: Remix.men_line,
      ),
      AppCategory(
        name: 'Women',
        searchQuery: 'women fashion',
        icon: Remix.women_line,
      ),
      AppCategory(
        name: 'Kids',
        searchQuery: 'kids fashion',
        icon: Remix.bear_smile_line,
      ),
      AppCategory(
        name: 'Shoes',
        searchQuery: 'shoes',
        icon: Remix.footprint_line,
      ),
      AppCategory(name: 'Bags', searchQuery: 'bags', icon: Remix.handbag_line),
      AppCategory(
        name: 'Jewelry',
        searchQuery: 'jewelry',
        icon: Remix.vip_diamond_line,
      ),
    ],
  ),
  AppCategory(
    name: 'Home & Kitchen',
    searchQuery: 'home kitchen',
    icon: Remix.home_line,
    subCategories: [
      AppCategory(
        name: 'Furniture',
        searchQuery: 'furniture',
        icon: Remix.sofa_line,
      ),
      AppCategory(
        name: 'Cooking',
        searchQuery: 'cooking',
        icon: Remix.restaurant_line,
      ),
      AppCategory(
        name: 'Bedding',
        searchQuery: 'bedding',
        icon: Remix.hotel_bed_line,
      ),
      AppCategory(
        name: 'Decor',
        searchQuery: 'home decor',
        icon: Remix.paint_brush_line,
      ),
    ],
  ),
  AppCategory(
    name: 'Beauty',
    searchQuery: 'beauty',
    icon: Remix.heart_line,
    subCategories: [
      AppCategory(
        name: 'Skincare',
        searchQuery: 'skincare',
        icon: Remix.seedling_line,
      ),
      AppCategory(
        name: 'Makeup',
        searchQuery: 'makeup',
        icon: Remix.palette_line,
      ),
      AppCategory(
        name: 'Perfume',
        searchQuery: 'perfume',
        icon: Remix.flask_line,
      ),
      AppCategory(
        name: 'Hair',
        searchQuery: 'hair care',
        icon: Remix.scissors_line,
      ),
    ],
  ),
  AppCategory(
    name: 'Sports',
    searchQuery: 'sports',
    icon: Remix.football_line,
    subCategories: [
      AppCategory(
        name: 'Fitness',
        searchQuery: 'fitness equipment',
        icon: Remix.run_line,
      ),
      AppCategory(
        name: 'Football',
        searchQuery: 'football',
        icon: Remix.football_line,
      ),
      AppCategory(
        name: 'Basketball',
        searchQuery: 'basketball',
        icon: Remix.basketball_line,
      ),
      AppCategory(
        name: 'Outdoor',
        searchQuery: 'outdoor sports',
        icon: Remix.riding_line,
      ),
    ],
  ),
];
