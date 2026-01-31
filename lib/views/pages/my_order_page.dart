import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/views/widgets/custom_app_bar.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Order', onPressed: () {}),

      body: Center(child: Text('My Order page')),
    );
  }
}
