
import 'package:dartz/dartz.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/data/model/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, List<Profile>>> getProfile();
}