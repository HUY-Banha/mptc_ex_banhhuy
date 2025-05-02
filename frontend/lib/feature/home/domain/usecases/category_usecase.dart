import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/core/injection/injection.dart';
import 'package:mptc_exercise_banhahuy/core/usecases/base_string_use_case.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/repository/home_repository_impl.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/repository/home_repository.dart';

@LazySingleton()
@injectable
class CategoryUsecase implements BaseStringUseCase<Either<Failure, List<Category>>, String> {
  final HomeRepository _homeRepository = getIt<HomeRepositoryImpl>(); // Injected by GetIt through injectable

  @override
  Future<Either<Failure, List<Category>>> call() async {
    try {
      final response = await _homeRepository.getCategory();
      return response.fold(
        (failure) => left(failure),
        (categories) => right(categories.map((category) => Category(
          id: category.id,
          name: category.name,
          title: category.title,
          body: category.body,
        )).toList()),
      );
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
