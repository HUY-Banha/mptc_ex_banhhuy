// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mptc_exercise_banhahuy/core/networks/dio_client.dart' as _i338;
import 'package:mptc_exercise_banhahuy/feature/home/data/repository/home_repository_impl.dart'
    as _i738;
import 'package:mptc_exercise_banhahuy/feature/home/data/source/home_remote_data_source.dart'
    as _i656;
import 'package:mptc_exercise_banhahuy/feature/home/domain/usecases/category_usecase.dart'
    as _i386;
import 'package:mptc_exercise_banhahuy/feature/profile/data/repository/profile_repository_impl.dart'
    as _i125;
import 'package:mptc_exercise_banhahuy/feature/profile/data/source/profile_remote_data_source.dart'
    as _i45;
import 'package:mptc_exercise_banhahuy/feature/profile/domain/usecases/profile_usecase.dart'
    as _i369;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i338.DioClient>(() => _i338.DioClient());
    gh.lazySingleton<_i738.HomeRepositoryImpl>(
        () => _i738.HomeRepositoryImpl());
    gh.lazySingleton<_i656.HomeRemoteDataSourceImpl>(
        () => _i656.HomeRemoteDataSourceImpl());
    gh.lazySingleton<_i386.CategoryUsecase>(() => _i386.CategoryUsecase());
    gh.lazySingleton<_i125.ProfileRepositoryImpl>(
        () => _i125.ProfileRepositoryImpl());
    gh.lazySingleton<_i45.ProfileRemoteDataSourceImpl>(
        () => _i45.ProfileRemoteDataSourceImpl());
    gh.lazySingleton<_i369.ProfileUsecase>(() => _i369.ProfileUsecase());
    return this;
  }
}
