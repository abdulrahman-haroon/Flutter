import 'package:clean_arch/features/daily_news/data/models/article.dart';
import 'package:floor/floor.dart';

@dao
abstract class ArticleDao {
  
  //insert
  @Insert()
  Future<void> insertArticle(ArticleModel article);
  //delete
  @delete
  Future<void> deleteArticle(ArticleModel article);
  //get
  @Query('SELECT * FROM article')
  Future<List<ArticleModel>> getArticles();
}
