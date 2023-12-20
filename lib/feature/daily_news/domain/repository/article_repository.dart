import 'package:clean_arctheture/core/resources/data_state.dart';
import 'package:clean_arctheture/feature/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  //API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  //Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticles(ArticleEntity article);

  Future<void> removeArticles(ArticleEntity article);
}
