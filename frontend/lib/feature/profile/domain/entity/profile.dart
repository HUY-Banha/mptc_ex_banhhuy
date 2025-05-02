import 'package:mptc_exercise_banhahuy/feature/home/domain/entity/category.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/domain/entity/contract_method.dart';

class ProfileEntity {
  final String? id;
  final String? name;
  final String? role;
  final String? photoUrl;
  final List<CategoryEntity>? skills;
  final String? bio;
  final ContractMethodEntity? contractMethod;

  ProfileEntity({
    this.id,
    this.name,
    this.role,
    this.photoUrl,
    this.skills,
    this.bio,
    this.contractMethod,
  });
}
