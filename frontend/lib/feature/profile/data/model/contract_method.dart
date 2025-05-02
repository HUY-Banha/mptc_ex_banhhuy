import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/domain/entity/contract_method.dart';

part 'contract_method.freezed.dart';
part 'contract_method.g.dart';

@freezed
class ContractMethod with _$ContractMethod implements ContractMethodEntity {
  const factory ContractMethod({
    String? email,
    String? linkedIn,
    String? github,
  }) = _ContractMethod;

  factory ContractMethod.fromJson(Map<String, dynamic> json) =>
      _$ContractMethodFromJson(json);
}