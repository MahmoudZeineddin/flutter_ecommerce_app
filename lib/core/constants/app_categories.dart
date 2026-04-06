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

const List<AppCategory> popularCollections = [
  AppCategory(
    name: 'Women Fashion',
    searchQuery: 'women fashion',
    icon: Remix.women_line,
    imageUrl:
        'https://images.unsplash.com/photo-1483985988355-763728e1935b?w=400',
  ),
  AppCategory(
    name: 'Men Fashion',
    searchQuery: 'men fashion',
    icon: Remix.men_line,
    imageUrl:
        'https://images.unsplash.com/photo-1490578474895-699cd4e2cf59?w=400',
  ),
  AppCategory(
    name: 'Electronics',
    searchQuery: 'electronics',
    icon: Remix.computer_line,
    imageUrl:
        'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400',
  ),
  AppCategory(
    name: 'Beauty',
    searchQuery: 'beauty',
    icon: Remix.heart_line,
    imageUrl:
        'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=400',
  ),
  AppCategory(
    name: 'Sports',
    searchQuery: 'sports',
    icon: Remix.football_line,
    imageUrl:
        'https://images.unsplash.com/photo-1517649763962-0c623066013b?w=400',
  ),
  AppCategory(
    name: 'Home & Kitchen',
    searchQuery: 'home kitchen',
    icon: Remix.home_line,
    imageUrl: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400',
  ),
  AppCategory(
    name: 'Kids Fashion',
    searchQuery: 'kids fashion',
    icon: Remix.bear_smile_line,
    imageUrl:
        'https://images.unsplash.com/photo-1622290291468-a28f7a7dc6a8?w=400',
  ),
  AppCategory(
    name: 'Accessories',
    searchQuery: 'accessories',
    icon: Remix.handbag_line,
    imageUrl:
        'https://images.unsplash.com/photo-1509941943102-10c232535736?w=400',
  ),
];
