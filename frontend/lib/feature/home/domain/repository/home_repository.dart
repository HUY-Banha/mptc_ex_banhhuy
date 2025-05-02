
import 'package:dartz/dartz.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Category>>> getCategory();
  Future<Either<Failure, List<Profile>>> getProfile();
}