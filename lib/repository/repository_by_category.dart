import 'package:base_project/models/model_by_category.dart';
import 'package:base_project/networking/http/http_provider.dart';

class RepositoryByCategory {
  final HttpProvider _provider = HttpProvider();

  Future<ModelByCategory> getByCategory(String category) async {
    final response = await _provider.get("jokes/random?category" + category);
    return modelByCategoryFromJson(response);
  }
}
