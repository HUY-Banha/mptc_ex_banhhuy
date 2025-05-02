part of 'category_bloc.dart';

sealed class CategoryEvent {}

final class CategoryStarted extends CategoryEvent {}

final class CategoryGetCategory extends CategoryEvent {
  CategoryGetCategory();
}

final class CategorySelected extends CategoryEvent {
  final int categoryId;

  CategorySelected({required this.categoryId});
}