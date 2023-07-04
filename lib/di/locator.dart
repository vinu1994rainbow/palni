import 'package:get_it/get_it.dart';

import '../cubit_bloc/home_cubit/home_cubit.dart';
import '../data/api.dart';
import '../data/repository/homerepository.dart';
import '../data/services/homeservice.dart';

final getIt = GetIt.instance;

void setup() {
  /// Dio
 getIt.registerLazySingleton<Api>(() => Api());

  /// Shred preferences
//  getIt.registerLazySingleton<SharedConstants>(() => SharedConstants());

  /// Local database
 // getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);

  ///repository

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());
  ///service
  getIt.registerLazySingleton<HomeService>(() => HomeService());

  ///cubit
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());

}
