part of 'category_bloc.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<Category> categories;

  CategoryLoaded({required this.categories});
  @override
  String toString() => 'CategoryLoaded { categories: $categories }';
}

final class CategoryError extends CategoryState {
  final String message;

  CategoryError({required this.message});
}
final class CategorySelectedSate extends CategoryState {
  final Category category;

  CategorySelectedSate({required this.category});
  
  @override
  String toString() => 'CategorySelectedSate { categoryId: ${category.toJson()} }';
}