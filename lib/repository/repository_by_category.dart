import 'package:base_project/models/model_by_category.dart';
import 'package:base_project/networking/api_provider.dart';

class RepositoryByCategory {
  final ApiProvider _provider = ApiProvider();

  Future<ModelByCategory> getByCategory(String category) async {
    final response = await _provider.get("jokes/random?category" + category);
    return modelByCategoryFromJson(response);
  }
}
