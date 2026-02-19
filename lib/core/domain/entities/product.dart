/*
Entity = What business understands ("Product has title")
Model = What API returns ("product_title" from JSON)
API can change, Entity stays same

When you NEED entities:
Multiple data sources (Amazon + eBay)
Complex business logic
Large team project
*/

class Product {
  // Pure business object
  final String id;
  final String title;
  final double price;

  Product({required this.id, required this.title, required this.price});

  // NO fromJson() here!
  // NO API stuff!
  // Just pure business data
}
