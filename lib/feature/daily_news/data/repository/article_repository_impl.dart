import 'package:clean_arctheture/core/resources/data_state.dart';
import 'package:clean_arctheture/feature/daily_news/data/models/article.dart';
import 'package:clean_arctheture/feature/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }

}