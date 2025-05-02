

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/core/injection/injection.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/source/profile_remote_data_source.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/domain/repository/profile_repository.dart';

@LazySingleton()
@injectable
class ProfileRepositoryImpl implements ProfileRepository {
  final IProfileRemoteDataSource _remoteDataSource = getIt<ProfileRemoteDataSourceImpl>();

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
