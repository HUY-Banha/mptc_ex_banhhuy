

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/core/injection/injection.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/source/home_remote_data_source.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/repository/home_repository.dart';

@LazySingleton()
@injectable
class HomeRepositoryImpl implements HomeRepository {
  final IHomeRemoteDataSource _remoteDataSource = getIt<HomeRemoteDataSourceImpl>();

  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
    try {
      final response = await _remoteDataSource.getCategory();
      return response.fold(
        (failure) => left(failure),
        (categories) {
          return right(categories);
        },
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Profile>>> getProfile()async {
    try {
      final response = await _remoteDataSource.getProfile();
      return response.fold(
        (failure) => left(failure),
        (profiles) {
          return right(profiles);
        },
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
