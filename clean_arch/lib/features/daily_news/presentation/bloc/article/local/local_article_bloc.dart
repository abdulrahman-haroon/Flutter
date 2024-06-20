// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_arch/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:clean_arch/features/daily_news/domain/usecases/remove_article.dart';
import 'package:clean_arch/features/daily_news/domain/usecases/save_article.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleCase _getSaveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleCase _saveArticleCase;

  LocalArticleBloc(
    this._getSaveArticleUseCase,
    this._removeArticleUseCase,
    this._saveArticleCase,
  ) : super(const LocalArticleLoading()) {
    on<GetSavedArticle>(onGetSavedArticles);
    on<SaveArticle>(onSaveArticle);
    on<RemoveArticle>(onRemoveArticle);
  }
  void onGetSavedArticles(
      GetSavedArticle event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  void onSaveArticle(
      SaveArticle saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleCase(params: saveArticle.article);
    final articles = await _getSaveArticleUseCase();
    emit(LocalArticleDone(articles));
  }
}
