import 'package:base_project/models/model_category.dart';
import 'package:base_project/networking/dio/dio_provider.dart';
import 'package:base_project/networking/http/api_provider.dart';

class RepositoryCategory {
  final ApiProvider _provider = ApiProvider();
  final DioProvider _dioProvider = DioProvider(withAuth: false);

  Future<ModelCategory> getCategory() async {
    final response = await _provider.get("jokes/categories");
    print(response);
    return ModelCategory.fromJson(response);
  }
}
