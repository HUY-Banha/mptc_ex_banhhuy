import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:mptc_exercise_banhahuy/core/failure/failure.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/repository/home_repository.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/usecases/category_usecase.dart';
import 'package:mockito/annotations.dart';

import 'category_usecase_test.mocks.dart';



@GenerateMocks([HomeRepository])
void main() {
  late CategoryUsecase usecase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    // usecase;
    // = CategoryUsecase(mockRepository);
  });

  final testCategories = [
    Category(id: 1, name: 'Test', title: 'Test Title', body: 'Test Body'),
  ];

  test('should return list of categories when repository call is successful', () async {
    when(mockRepository.getCategory()).thenAnswer(
          (_) async => Right(testCategories),
    );

    final result;
    // = await usecase();

    //expect(result, Right(testCategories));
    // expect(result, Right<Failure, List<Category>>(testCategories));

    // expect(result, equals(Right<Failure, List<Category>>(testCategories)));


    result.fold(
          (failure) => fail('Expected Right but got Left: $failure'),
          (categories) => expect(categories, testCategories),
    );


    verify(mockRepository.getCategory());
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return Failure when repository call fails', () async {
    final failure = ServerFailure('Failed to fetch');
    when(mockRepository.getCategory()).thenAnswer(
          (_) async => Left(failure),
    );

    final result = await usecase();

    expect(result, Left(failure));
    verify(mockRepository.getCategory());
    verifyNoMoreInteractions(mockRepository);
  });
}
