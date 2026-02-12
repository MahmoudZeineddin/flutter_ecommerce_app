import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/routers/app_routes.dart';
import 'package:flutter_ecommerce_app/presentation/view_models/product_details__cubit/product_details_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/pages/product_details_page.dart';
import 'package:flutter_ecommerce_app/presentation/pages/custom_bottom_nav_bar.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const CustomBottomNavBar(),
          );
        }

      case AppRoutes.productDetailsRoute:
        final String productId = settings.arguments as String;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (context) {
              final cubit = ProductsDetailsCubit();
              cubit.getProductDetails(productId);
              return cubit;
            },
            child: ProductDetailsPage(productId: productId),
          ),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return Center(
              child: Text('No Router defined for ${settings.name}'),
            );
          },
        );
    }
  }
}
