import 'dart:io';

import 'package:clean_arctheture/core/constants/constants.dart';
import 'package:clean_arctheture/core/resources/data_state.dart';
import 'package:clean_arctheture/feature/daily_news/data/data_source/local/app_database.dart';
import 'package:clean_arctheture/feature/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_arctheture/feature/daily_news/data/models/article.dart';
import 'package:clean_arctheture/feature/daily_news/domain/entities/article.dart';
import 'package:clean_arctheture/feature/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;
  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apikey: newsAPIkey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() async {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticles(ArticleEntity article) {
    return _appDatabase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticles(ArticleEntity article) {
    return _appDatabase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
