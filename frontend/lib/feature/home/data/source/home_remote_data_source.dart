import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/core/injection/injection.dart';
import 'package:mptc_exercise_banhahuy/core/networks/dio_client.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';

@LazySingleton()
@injectable
class HomeRemoteDataSourceImpl implements IHomeRemoteDataSource {
  @override
  final DioClient _client = getIt<DioClient>();
  @override
  Future<Either<Failure, List<Category>>> getCategory() async {
  try {
    final response = await _client.dio.get("/category"); // Use 10.0.2.2 for Android emulator
    print("""object ${response.data}""");
    if (response.statusCode != 200) {
      return left(ServerFailure(response.data['message']));
    } else {
      final List data = response.data;
      final categories = data.map((e) => Category.fromJson(e)).toList();
      return right(categories);
    }
  } catch (e) {
    return left(ServerFailure(e.toString()));
  }
}

  @override
  Future<Either<Failure, List<Profile>>> getProfile() async {
    try {
      final response = await _client.dio.get("/profiles"); 
      if (response.statusCode != 200) {
        return left(ServerFailure(response.data['message']));
      } else {
        final List data = response.data;
        final profiles = data.map((e) => Profile.fromJson(e)).toList();
        return right(profiles);
      }
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
  
}



abstract class IHomeRemoteDataSource {
  Future<Either<Failure, List<Category>>> getCategory();
  Future<Either<Failure, List<Profile>>> getProfile();
}
