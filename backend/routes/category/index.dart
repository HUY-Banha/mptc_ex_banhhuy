import 'package:dart_frog/dart_frog.dart';
import '../../services/category_service.dart';

final CategoryService _categoryService = CategoryService();

Future<Response> onRequest(RequestContext context) async {
  return Response.json(
    body: _categoryService.getAllCategories().map((c) => c.toJson()).toList(),
  );
}
