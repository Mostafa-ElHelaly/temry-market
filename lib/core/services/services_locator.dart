import 'package:temry_market/data/data_sources/remote/recpies_remote_data_source.dart';
import 'package:temry_market/data/repositories/recpies_repository_impl.dart';
import 'package:temry_market/domain/repositories/respies_repository.dart';
import 'package:temry_market/domain/usecases/delivery_info/clear_local_delivery_info_usecase.dart';
import 'package:temry_market/domain/usecases/delivery_info/edit_delivery_info_usecase.dart';
import 'package:temry_market/domain/usecases/delivery_info/get_selected_delivery_info_usecase.dart';
import 'package:temry_market/domain/usecases/delivery_info/select_delivery_info_usecase.dart';
import 'package:temry_market/domain/usecases/order/clear_local_order_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temry_market/domain/usecases/respies/get_remote_respies_usecase.dart';
import 'package:temry_market/domain/usecases/user/forget_password_usecase.dart';
import 'package:temry_market/presentation/blocs/respies/respies_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignIn/sign_in_bloc.dart';
import 'package:temry_market/presentation/blocs/user/SignUp/sign_up_bloc.dart';
import 'package:temry_market/presentation/blocs/user/forget_password_bloc/forget_password_bloc.dart';

import 'package:temry_market/data/data_sources/local/cart_local_data_source.dart';
import 'package:temry_market/data/data_sources/local/delivery_info_local_data_source.dart';
import 'package:temry_market/data/data_sources/local/order_local_data_source.dart';
import 'package:temry_market/data/data_sources/local/user_local_data_source.dart';
import 'package:temry_market/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:temry_market/data/data_sources/remote/category_remote_data_source.dart';
import 'package:temry_market/data/data_sources/remote/delivery_info_remote_data_source.dart';
import 'package:temry_market/data/data_sources/remote/order_remote_data_source.dart';
import 'package:temry_market/data/data_sources/remote/product_remote_data_source.dart';
import 'package:temry_market/data/data_sources/remote/user_remote_data_source.dart';
import 'package:temry_market/data/repositories/cart_repository_impl.dart';
import 'package:temry_market/data/repositories/category_repository_impl.dart';
import 'package:temry_market/data/repositories/delivery_info_impl.dart';
import 'package:temry_market/data/repositories/order_repository_impl.dart';
import 'package:temry_market/data/repositories/product_repository_impl.dart';
import 'package:temry_market/data/repositories/user_repository_impl.dart';
import 'package:temry_market/domain/repositories/cart_repository.dart';
import 'package:temry_market/domain/repositories/category_repository.dart';
import 'package:temry_market/domain/repositories/delivery_info_repository.dart';
import 'package:temry_market/domain/repositories/order_repository.dart';
import 'package:temry_market/domain/repositories/product_repository.dart';
import 'package:temry_market/domain/repositories/user_repository.dart';
import 'package:temry_market/domain/usecases/cart/add_cart_item_usecase.dart';
import 'package:temry_market/domain/usecases/cart/clear_cart_usecase.dart';
import 'package:temry_market/domain/usecases/cart/get_cached_cart_usecase.dart';
import 'package:temry_market/domain/usecases/cart/sync_cart_usecase.dart';
import 'package:temry_market/domain/usecases/category/get_remote_category_usecase.dart';
import 'package:temry_market/domain/usecases/delivery_info/add_dilivey_info_usecase.dart';
import 'package:temry_market/domain/usecases/delivery_info/get_cached_delivery_info_usecase.dart';
import 'package:temry_market/domain/usecases/delivery_info/get_remote_delivery_info_usecase.dart';
import 'package:temry_market/domain/usecases/order/add_order_usecase.dart';
import 'package:temry_market/domain/usecases/order/get_cached_orders_usecase.dart';
import 'package:temry_market/domain/usecases/order/get_remote_orders_usecase.dart';
import 'package:temry_market/domain/usecases/product/get_product_usecase.dart';
import 'package:temry_market/domain/usecases/user/get_cached_user_usecase.dart';
import 'package:temry_market/domain/usecases/user/sign_in_usecase.dart';
import 'package:temry_market/domain/usecases/user/sign_out_usecase.dart';
import 'package:temry_market/domain/usecases/user/sign_up_usecase.dart';
import 'package:temry_market/presentation/blocs/cart/cart_bloc.dart';
import 'package:temry_market/presentation/blocs/category/category_bloc.dart';
import 'package:temry_market/presentation/blocs/delivery_info/delivery_info_action/delivery_info_action_cubit.dart';
import 'package:temry_market/presentation/blocs/delivery_info/delivery_info_fetch/delivery_info_fetch_cubit.dart';
import 'package:temry_market/presentation/blocs/order/order_add/order_add_cubit.dart';
import 'package:temry_market/presentation/blocs/order/order_fetch/order_fetch_cubit.dart';
import 'package:temry_market/presentation/blocs/product/product_bloc.dart';
import 'package:temry_market/core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Features - Product
  // Bloc
  sl.registerFactory(
    () => ProductBloc(productUseCase: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetProductUseCase(baseRepository: sl()));
  // Repository
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(),
  );

  //Features - Recipes
  // Bloc
  sl.registerFactory(
    () => RecipesBloc(recipesUseCase: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRemoteRecipesUseCase(repository: sl()));
  // Repository
  sl.registerLazySingleton<RecipesBaseRepository>(
    () => RecipesRepositoryImp(
      baseRemotelyDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<RecipesRemotelyDateSource>(
    () => RecipesRemotelyDateSource(),
  );

  //Features - Category
  // Bloc
  sl.registerFactory(
    () => CategoryBloc(CategoryUseCase: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRemoteCategoryUseCase(repository: sl()));
  // Repository
  sl.registerLazySingleton<CategoriesBaseRepository>(
    () => CategoriesRepositoryImp(
      baseRemotelyDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<CategoryRemotelyDateSource>(
    () => CategoryRemotelyDateSource(),
  );

  //Features - Cart
  // Bloc
  sl.registerFactory(
    () => CartBloc(sl(), sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetCachedCartUseCase(sl()));
  sl.registerLazySingleton(() => AddCartUseCase(sl()));
  sl.registerLazySingleton(() => SyncCartUseCase(sl()));
  sl.registerLazySingleton(() => ClearCartUseCase(sl()));
  // Repository
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Features - Delivery Info
  // Bloc
  sl.registerFactory(
    () => DeliveryInfoActionCubit(sl(), sl(), sl()),
  );
  sl.registerFactory(
    () => DeliveryInfoFetchCubit(sl(), sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => GetRemoteDeliveryInfoUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedDeliveryInfoUseCase(sl()));
  sl.registerLazySingleton(() => AddDeliveryInfoUseCase(sl()));
  sl.registerLazySingleton(() => EditDeliveryInfoUseCase(sl()));
  sl.registerLazySingleton(() => SelectDeliveryInfoUseCase(sl()));
  sl.registerLazySingleton(() => GetSelectedDeliveryInfoInfoUseCase(sl()));
  sl.registerLazySingleton(() => ClearLocalDeliveryInfoUseCase(sl()));
  // Repository
  sl.registerLazySingleton<DeliveryInfoRepository>(
    () => DeliveryInfoRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<DeliveryInfoRemoteDataSource>(
    () => DeliveryInfoRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<DeliveryInfoLocalDataSource>(
    () => DeliveryInfoLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Features - Order
  // Bloc
  sl.registerFactory(
    () => OrderAddCubit(sl()),
  );
  sl.registerFactory(
    () => OrderFetchCubit(sl(), sl(), sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => AddOrderUseCase(sl()));
  sl.registerLazySingleton(() => GetRemoteOrdersUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedOrdersUseCase(sl()));
  sl.registerLazySingleton(() => ClearLocalOrdersUseCase(sl()));
  // Repository
  sl.registerLazySingleton<OrderRepository>(
    () => OrderRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      userLocalDataSource: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<OrderLocalDataSource>(
    () => OrderLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //Features - User
  // Bloc
  // sl.registerFactory(
  //   () => UserBloc(sl(), sl(), sl(), sl()),
  // );
  sl.registerFactory(
    () => SignUpBloc(registerUseCase: sl()),
  );
  sl.registerFactory(
    () => SignInBloc(SignInUseCase: sl()),
  );
  sl.registerFactory(
    () => ForgetPasswordBloc(
      forgetPasswordUseCase: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCachedUserUseCase(sl()));
  sl.registerLazySingleton(() => SignINUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignOutUseCase(sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(sl()));
  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl(), secureStorage: sl()),
  );
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: sl()),
  );

  ///***********************************************
  ///! Core
  /// sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///! External
  final sharedPreferences = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => secureStorage);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
