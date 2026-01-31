import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomAppBar({super.key, required this.title, required this.onPressed});

  //  how can I add go back icon if the page need that
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      title: Text(title, style: AppTextStyles.headingSmallSize(context)),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(RemixIcons.shopping_bag_4_line),
        ),
      ],
    );
  }

  // should change it
  @override
  Size get preferredSize => const Size.fromHeight(39);
  //  throw UnimplementedError();
}
