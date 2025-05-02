import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mptc_exercise_banhahuy/feature/home/data/models/category.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/usecases/category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryUsecase _usecase;
  CategoryBloc(this._usecase) : super(CategoryInitial()) {

    List<Category> categoriesList = [];

    on<CategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CategoryStarted>((event, emit) async {
      try {
        emit(CategoryLoading());
        final result = await _usecase.call();
        result.fold(
          (failure) {
            emit(CategoryError(message: failure.message));
          },
          (categories) {
            categoriesList = categories;
            emit(CategoryLoaded(categories: categories));
          },
        );
      } catch (e) {
        emit(CategoryError(message: e.toString()));
      }
    });
    on<CategorySelected>((event, emit) {
      final category = categoriesList.firstWhere((category) => category.id == event.categoryId);
      emit(CategorySelectedSate(category: category));
    });
  }
}
