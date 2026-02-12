import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ecommerce_app/core/routers/app_router.dart';
import 'package:flutter_ecommerce_app/core/themes/colors.dart';
import 'package:flutter_ecommerce_app/data/models/data_sources/remote/amazon/amazon_api_client.dart';
import 'package:flutter_ecommerce_app/presentation/pages/custom_bottom_nav_bar.dart';

Future<void> main() async {
  // Use async/await to load .env from storage before UI rendering to prevent crashes.
  await dotenv.load(fileName: ".env");
  final apiClient = AmazonApiClient();

  apiClient.fetchTestProducts();
  runApp(const MyApp());
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
