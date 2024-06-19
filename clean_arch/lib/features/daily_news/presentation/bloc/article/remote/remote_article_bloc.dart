import 'package:clean_arch/core/resources/data_state.dart';
import 'package:clean_arch/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticlets);
  }

  void onGetArticlets(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print(dataState.data);
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
