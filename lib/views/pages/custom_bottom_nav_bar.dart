import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/themes/colors.dart';
import 'package:flutter_ecommerce_app/views/pages/favorite_page.dart';
import 'package:flutter_ecommerce_app/views/pages/home_page.dart';
import 'package:flutter_ecommerce_app/views/pages/my_order_page.dart';
import 'package:flutter_ecommerce_app/views/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:remixicon/remixicon.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late final PersistentTabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    // ـ PersistentTabController: هو المسؤول عن التنقل الأفقي بين الأقسام
    _controller.addListener(() {
      if (_controller.index != _selectedIndex) {
        setState(() {
          _selectedIndex = _controller.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<PersistentTabConfig> _tabs() {
    //   خاص به Navigatorكل تاب له
    return [
      PersistentTabConfig(
        screen: const HomePage(),
        item: ItemConfig(
          icon: Icon(
            _selectedIndex == 0 ? Remix.home_5_fill : Remix.home_5_line,
          ),
          title: "Home",
          activeForegroundColor: AppColors.primaryColor,
          inactiveForegroundColor: AppColors.inactiveGrey,
        ),
      ),
      PersistentTabConfig(
        screen: const MyOrderPage(),
        item: ItemConfig(
          icon: Icon(_selectedIndex == 1 ? Remix.truck_fill : Remix.truck_line),
          title: "My Order",
          activeForegroundColor: AppColors.primaryColor,
          inactiveForegroundColor: AppColors.inactiveGrey,
        ),
      ),
      PersistentTabConfig(
        screen: const FavoritePage(),
        item: ItemConfig(
          icon: Icon(
            _selectedIndex == 2 ? Remix.heart_3_fill : Remix.heart_3_line,
          ),
          title: "Favorite",
          activeForegroundColor: AppColors.primaryColor,
          inactiveForegroundColor: AppColors.inactiveGrey,
        ),
      ),
      PersistentTabConfig(
        screen: const ProfilePage(),
        item: ItemConfig(
          icon: Icon(
            _selectedIndex == 3 ? Remix.user_3_fill : Remix.user_3_line,
          ),
          title: "Profile",
          activeForegroundColor: AppColors.primaryColor,
          inactiveForegroundColor: AppColors.inactiveGrey,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (NavBarConfig navBarBuilder) => Style6BottomNavBar(
        navBarConfig: navBarBuilder,
        navBarDecoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0),
          color: AppColors.scaffoldBackground,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 400),
      ),

      onTabChanged: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: AppColors.scaffoldBackground,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
    );
  }
}
