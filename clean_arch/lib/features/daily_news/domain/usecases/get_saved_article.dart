import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/core/usecases/usecase.dart';
import 'package:clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:clean_arch/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleCase
    implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }
}
