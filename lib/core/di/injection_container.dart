import 'package:flutter_ecommerce_app/core/data/data_sources/remote/amazon/amazon_api_client.dart';
import 'package:flutter_ecommerce_app/core/data/repositories/product_repository_impl.dart';
import 'package:flutter_ecommerce_app/core/domain/repositories/product_repository.dart';
import 'package:flutter_ecommerce_app/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

// Dependency Injection (DI) is an automatic factory for creating objects.
//  In dart we can create a function without create class..
final sl = GetIt.instance;
//Wire all dependencies together automatically so HomeCubit gets Repository without manual creation everywhere.
Future<void> initializeDependencies() async {
  // Data sources
  sl.registerLazySingleton<AmazonApiClient>(() => AmazonApiClient());

  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );

  // Cubits
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
