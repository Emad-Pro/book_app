import 'package:bloc/bloc.dart';
import 'package:book_app_mvvm/fetures/home/data/model/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repository/home_repository.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  final SearchRepository searchRepository;
  SearchBooksCubit(this.searchRepository) : super(SearchBooksInitial());
  Future<void> getSearchData({required String textSearch}) async {
    emit(SearchBooksLoading());
    final response = await searchRepository.searchBooks(booksName: textSearch);
    response.fold((l) => emit(SearchBooksErorr(l.erorrMessage)), (r) => emit(SearchBooksLoaded(r)));
  }
}
