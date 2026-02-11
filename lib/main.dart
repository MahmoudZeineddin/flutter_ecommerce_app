import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/routers/app_router.dart';
import 'package:flutter_ecommerce_app/core/themes/colors.dart';
import 'package:flutter_ecommerce_app/data/remote/amazon/amazon_api_client.dart';
import 'package:flutter_ecommerce_app/views/pages/custom_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
  const apiKey = '';
  final apiClient = AmazonApiClient(apiKey: apiKey);

  apiClient.fetchTestProducts();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce_app',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
      debugShowCheckedModeBanner: false,
      home: const CustomBottomNavBar(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
