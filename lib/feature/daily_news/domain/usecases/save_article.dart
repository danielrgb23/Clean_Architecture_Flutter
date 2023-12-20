import 'package:clean_arctheture/core/resources/data_state.dart';
import 'package:clean_arctheture/core/usecases/usecase.dart';
import 'package:clean_arctheture/feature/daily_news/domain/entities/article.dart';
import 'package:clean_arctheture/feature/daily_news/domain/repository/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepository.saveArticles(params!);
  }
}
