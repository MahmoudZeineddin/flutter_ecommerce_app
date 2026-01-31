import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common.dart';
import 'package:flutter_ecommerce_app/view_models/home_cubit/home_cubit.dart';
import 'package:flutter_ecommerce_app/views/widgets/custom_tap_bar.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_page/category_tap_bar_view.dart';
import 'package:flutter_ecommerce_app/views/widgets/home_page/home_tap_bar_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tapController;

  @override
  void initState() {
    super.initState();
    _tapController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit();
        cubit.getHomeData();
        return cubit;
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: CachedNetworkImageProvider(
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1000",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Hi Mahmoud',
                            style: context.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Let\'s go shopping',
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Remix.search_line),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Remix.notification_4_line),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: context.heightPct(.02)),

              // TabBar(
              //   controller: _tapController,
              //   unselectedLabelColor: AppColors.inactiveGrey,
              //   dividerColor: Colors.transparent,
              //   labelColor: AppColors.mainText,
              //   // indicatorSize: TabBarIndicatorSize.label,
              //   indicator: const UnderlineTabIndicator(
              //     borderSide: BorderSide(
              //       width: 2.0,
              //       color: AppColors.primaryColor,
              //     ),
              //   ),
              //   tabs: [
              //     Tab(
              //       child: Container(
              //         width: context.widthPct(.25),
              //         alignment: Alignment.center,
              //         child: const Text("Home"),
              //       ),
              //     ),
              //     Tab(
              //       child: Container(
              //         width: context.widthPct(.25),
              //         alignment: Alignment.center,
              //         child: const Text("Category"),
              //       ),
              //     ),
              //   ],
              // ),
              const CustomTapBar(
                firstTapTitle: "Home",
                secoundTapTitle: "Category",
              ),

              // SizedBox(height: context.heightPct(.02)),
              // Expanded(
              //   child: TabBarView(
              //     controller: _tapController,
              //     children: [
              //       const HomeTapBarView(),
              //       const CategoryTapBarView(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
