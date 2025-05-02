import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/core/injection/injection.dart';
import 'package:mptc_exercise_banhahuy/core/usecases/base_string_use_case.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/repository/home_repository_impl.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/repository/home_repository.dart';

@LazySingleton()
@injectable
class ProfileUsecase implements BaseStringUseCase<Either<Failure, List<Profile>>, String> {
  final HomeRepository _homeRepository = getIt<HomeRepositoryImpl>(); // Injected by GetIt through injectable

  @override
  Future<Either<Failure, List<Profile>>> call() async {
    try {
      final response = await _homeRepository.getProfile();
      return response.fold(
        (failure) => left(failure),
        (profiles) => right(profiles.map((profile) => Profile(
          id: profile.id,
          name: profile.name,
          photoUrl: profile.photoUrl,
          role: profile.role,
          bio: profile.bio,
          skills: profile.skills?.map((skill) => Category(
            id: skill.id,
            name: skill.name,
            title: skill.title,
            body: skill.body,
          )).toList(),
          contractMethod: profile.contractMethod,
        )).toList()),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
