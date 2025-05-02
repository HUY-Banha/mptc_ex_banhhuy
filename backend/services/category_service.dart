import 'package:backend/models/category.dart';

class CategoryService {
  static final List<Category> _categories = [
    const Category(id: 0, name: 'All'),
    const Category(id: 1, name: 'Mobile'),
    const Category(id: 2, name: 'Frontend'),
    const Category(id: 3, name: 'Backend'),
    const Category(id: 4, name: 'UI/UX'),
    const Category(id: 5, name: 'DevOps'),
  ];

  // Fetch all categories
  List<Category> getAllCategories() {
    return _categories;
  }

  // Fetch category by ID
  Category? getCategoryById(int id) {
    return _categories.firstWhere((category) => category.id == id);
  }

  // Add a new category
  void addCategory(Category category) {
    _categories.add(category);
  }

  // Update an existing category
  void updateCategory(int id, Category updatedCategory) {
    final index = _categories.indexWhere((category) => category.id == id);
    if (index != -1) {
      _categories[index] = updatedCategory;
    }
  }

  // Delete a category by ID
  void deleteCategory(int id) {
    _categories.removeWhere((category) => category.id == id);
  }
}
