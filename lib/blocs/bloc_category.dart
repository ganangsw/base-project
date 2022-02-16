import 'package:base_project/models/model_category.dart';
import 'package:base_project/networking/response.dart';
import 'package:base_project/repository/repository_category.dart';
import 'package:rxdart/rxdart.dart';

class BlocCategory {
  final RepositoryCategory _repositoryCategory = RepositoryCategory();
  final BehaviorSubject<Response<ModelCategory>> _subject = BehaviorSubject();

  getCategory() async {
    _subject.add(Response.loading("Loading"));
    try {
      ModelCategory response = await _repositoryCategory.getCategory();
      _subject.add(Response.completed(response));
    } catch (e) {
      _subject.add(Response.error(e.toString()));
    }
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<Response<ModelCategory>> get subject => _subject;
}

final getCategoryBloc = BlocCategory();
