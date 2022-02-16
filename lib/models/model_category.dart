class ModelCategory {
  final List<String> categories;

  ModelCategory({required this.categories});

  factory ModelCategory.fromJson(List<dynamic> json) {
    return ModelCategory(
      categories: List<String>.from(json),
    );
  }

  List<dynamic> toJson() {
    List<dynamic> data = <String>[];
    data = categories;
    return data;
  }
}
