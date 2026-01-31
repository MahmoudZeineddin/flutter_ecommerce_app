import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_page/category_tap_bar_view.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_page/home_tap_bar_view.dart';

class CustomTapBar extends StatefulWidget {
  final String firstTapTitle;
  final String secoundTapTitle;
  const CustomTapBar({
    super.key,
    required this.firstTapTitle,
    required this.secoundTapTitle,
  });

  @override
  State<CustomTapBar> createState() => _CustomTapBarState();
}

class _CustomTapBarState extends State<CustomTapBar>
    with TickerProviderStateMixin {
  late final TabController _tapController;

  @override
  void initState() {
    super.initState();
    _tapController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tapController,
          unselectedLabelColor: AppColors.inactiveGrey,
          dividerColor: Colors.transparent,
          labelColor: AppColors.mainText,
          // indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.0, color: AppColors.primaryColor),
          ),
          tabs: [
            Tab(
              child: Container(
                width: context.widthPct(.25),
                alignment: Alignment.center,
                child: Text(widget.firstTapTitle),
              ),
            ),
            Tab(
              child: Container(
                width: context.widthPct(.25),
                alignment: Alignment.center,
                child: Text(widget.secoundTapTitle),
              ),
            ),
          ],
        ),

        // SizedBox(height: context.heightPct(.02)),
        // Expanded(
        //   child: TabBarView(
        //     controller: _tapController,
        //     children: [const HomeTapBarView(), const CategoryTapBarView()],
        //   ),
        // ),
      ],
    );
  }
}
