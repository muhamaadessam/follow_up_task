import 'package:get_it/get_it.dart';
import '../../features/follow_up/data/datasource/follow_up_remote_data_source.dart';
import '../../features/follow_up/data/repository/follow_up_repository.dart';
import '../../features/follow_up/domain/repository/base_follow_up_repository.dart';
import '../../features/follow_up/domain/usecases/get_follow_up_use_case.dart';
import '../../features/follow_up/presentation/controller/follow_up_cubit.dart';
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///Follow Up

    /// Bloc
    sl.registerFactory(() => FollowUpCubit(sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetFollowUpUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseFollowUpRepository>(
      () => FollowUpRepository(sl()),
    );

    /// DATA SOURCE
    sl.registerLazySingleton<BaseFollowUpRemoteDataSource>(
      () => FollowUpRemoteDataSource(),
    );

  }
}
