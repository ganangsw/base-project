import 'package:base_project/models/model_category.dart';
import 'package:base_project/networking/dio/dio_provider.dart';
import 'package:base_project/networking/http/http_provider.dart';

class RepositoryCategory {
  final HttpProvider _provider = HttpProvider();
  final DioProvider _dioProvider = DioProvider(withAuth: false);

  Future<ModelCategory> getCategory() async {
    final response = await _provider.get("jokes/categories");
    return ModelCategory.fromJson(response);
  }
}
