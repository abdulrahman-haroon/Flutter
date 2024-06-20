import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  //API Methods
  Future<DataState<List<ArticleEntity>>> getNewsArticle();

  //Database Methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
