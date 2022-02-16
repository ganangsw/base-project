import 'package:base_project/models/model_category.dart';
import 'package:base_project/networking/api_provider.dart';

class RepositoryCategory {
  final ApiProvider _provider = ApiProvider();

  Future<ModelCategory> getCategory() async {
    final response = await _provider.get("jokes/categories");
    return ModelCategory.fromJson(response);
  }
}
